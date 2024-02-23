FROM ubuntu:22.04 as build-base

ARG \
    BUILD_USERNAME="builder" \
    DEBIAN_FRONTEND="noninteractive" \
    OPENWRT_VERSION="v23.05.2"

LABEL version="0.0.1"
LABEL description="A working container for building OpenWrt"
LABEL repository="https://github.com/naa0yama/OpenWrt-FortiGate-50E-custom-image"

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
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m "${BUILD_USERNAME}" \
    && mkdir -p /etc/sudoers.d \
    && echo "${BUILD_USERNAME} ALL=NOPASSWD: ALL" > "/etc/sudoers.d/${BUILD_USERNAME}"

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

USER ${BUILD_USERNAME}
WORKDIR "/home/${BUILD_USERNAME}"


#- -----------------------------------------------------------------------------
#- - Preparing the source code
#- -----------------------------------------------------------------------------
# Build system usage
# Ref: https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem
FROM build-base as runner

# Download and update the sources
RUN set -eux \
    && git clone --verbose --progress --depth 1 --branch "${OPENWRT_VERSION}" \
    https://github.com/openwrt/openwrt.git \
    && cd openwrt

# # # Update the feeds
WORKDIR "/home/${BUILD_USERNAME}/openwrt"
RUN set -eux \
    && sed -i'' -e 's@git.openwrt.org/feed@github.com/openwrt@g' ./feeds.conf.default \
    && sed -i'' -e 's@git.openwrt.org/project@github.com/openwrt@g' ./feeds.conf.default \
    && cat ./feeds.conf.default \
    && ./scripts/feeds update -a \
    && ./scripts/feeds install -a

#- -----------------------------------------------------------------------------
#- - Runner
#- -----------------------------------------------------------------------------
FROM runner

COPY --chown=${BUILD_USERNAME}:${BUILD_USERNAME} \
    config/mvebu-cortexa9-fortinet_fg-50e.ini "/home/${BUILD_USERNAME}/openwrt/.config"
RUN set -eux \
    && make defconfig \
    && make --directory ./ -j $(($(nproc)+1)) download world \
    && rm -rf bin/targets
