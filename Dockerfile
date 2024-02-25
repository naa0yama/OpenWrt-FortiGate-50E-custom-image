FROM ubuntu:22.04 as build-base

ARG \
    DEBIAN_FRONTEND="noninteractive" \
    \
    BUILD_OPENWRT_VERSION="v23.05.2"

LABEL version="0.0.1"


#- -----------------------------------------------------------------------------
#- - Base
#- -----------------------------------------------------------------------------
# Build system setup
# Ref: https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem
RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    clang \
    flex \
    bison \
    g++ \
    gawk \
    gcc-multilib \
    g++-multilib \
    gettext \
    git \
    libncurses-dev \
    libssl-dev \
    python3-distutils \
    rsync \
    unzip \
    zlib1g-dev \
    file \
    wget \
    ca-certificates \
    libcurl4-openssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Debug settings
RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set git patching
RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gpg-agent \
    && add-apt-repository -y -u ppa:git-core/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && git --version --build-options

# gitconfig global
RUN set -eux \
    && git config --global user.name "user" \
    && git config --global user.email "user@example.com" \
    && git config --global http.postBuffer 500M \
    && git config --global https.postBuffer 500M

RUN mkdir -p /opt/openwrt

#- -----------------------------------------------------------------------------
#- - Preparing the source code
#- -----------------------------------------------------------------------------
# Build system usage
# Ref: https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem
FROM build-base as openwrt-base

# Download and update the sources
RUN set -eux \
    && git clone --verbose --progress --depth 1 --branch "${BUILD_OPENWRT_VERSION}" \
    https://github.com/openwrt/openwrt.git /opt/openwrt

# # # Update the feeds
RUN set -eux \
    && cd /opt/openwrt \
    && sed -i'' -e 's@git.openwrt.org/feed@github.com/openwrt@g' ./feeds.conf.default \
    && sed -i'' -e 's@git.openwrt.org/project@github.com/openwrt@g' ./feeds.conf.default \
    && cat ./feeds.conf.default \
    && ./scripts/feeds update -a \
    && ./scripts/feeds install -a

#- -----------------------------------------------------------------------------
#- - Runner
#- -----------------------------------------------------------------------------
# I pre-compile the toolchain and store it in a Docker image layer.
# This allows it to be used as a layer cache.
FROM openwrt-base as runner

ARG \
    BUILD_MAKE_OPTIONS=${BUILD_MAKE_OPTIONS:-V=sc}

COPY --chown=root:root \
    config/mvebu-cortexa9-fortinet_fg-50e.ini "/opt/openwrt/.config"

RUN set -eux \
    && bash --version \
    && bzip2 --version \
    && git --version \
    && gcc --version \
    && gawk --version \
    && gzip --version \
    && make --version \
    && openssl version \
    && patch --version \
    && perl --version \
    && python3 --version \
    && ls -la /usr/bin/python3*

RUN set -eux \
    && cd /opt/openwrt \
    && make defconfig

# DO NOT set -e
RUN set -ux \
    && cd /opt/openwrt \
    && rm -fv staging_dir/host/.prereq-build \
    && make prereq

RUN set -eux \
    && make --directory /opt/openwrt -j $(($(nproc)+1)) ${BUILD_MAKE_OPTIONS} download

RUN set -eux \
    && make --directory /opt/openwrt -j $(($(nproc)+1)) ${BUILD_MAKE_OPTIONS} world
