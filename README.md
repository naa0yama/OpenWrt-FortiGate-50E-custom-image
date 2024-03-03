# OpenWrt FortiGate 50E custom image

OpenWrt custom image for Fortinet FortiGate 50E (FRRouting+VRF+veth+WireGuard)

## Firmware settings

**[Custom settings can be found in this file](mvebu-cortexa9-fortinet_fg-50e.ini)**

```text
Target System (Marvell EBU Armada)  --->
Subtarget (Marvell Armada 37x/38x/XP)  --->
Target Profile (Fortinet FortiGate 50E)  --->

Target Images  --->
    [ ] ramdisk  ----
        *** Root filesystem archives ***
    [ ] cpio.gz (NEW)
    [ ] tar.gz
        *** Root filesystem images ***
    [ ] ext4 (NEW)  ----
    [*] squashfs (NEW)  --->
        *** Image Options ***
    (16) Kernel partition size (in MiB) (NEW)
    (104) Root filesystem partition size (in MiB) (NEW)
    [ ] Make /var persistent (NEW)

Global build settings
    [*] Include build configuration in firmware
    Kernel build options  --->
        [*] L3 Master device support

[*] Advanced configuration options (for developers)  --->
    [*] Use ccache
        (.ccache) Set ccache directory

[*] Build the OpenWrt Image Builder
[ ] Build the OpenWrt SDK
[ ] Build the LLVM-BPF toolchain tarball
[ ] Package the OpenWrt-based Toolchain
[*] Image configuration  --->
    [*]   Version configuration options  --->
        (naa0yama) Manufacturer name
        (https://github.com/naa0yama) Manufacturer URL

    Base system  --->
        < > dnsmasq.............................................. DNS and DHCP server
        < > dnsmasq-dhcpv6................. DNS and DHCP server (with DHCPv6 support)
        <*> dnsmasq-full
        [*]   Build with DHCP support. (NEW)
        [*]     Build with DHCPv6 support. (NEW)
        [*]   Build with DNSSEC support. (NEW)
        [*]   Build with the facility to act as an authoritative DNS server. (NEW)
        [*]   Build with IPset support.
        [*]   Build with Nftset support. (NEW)
        [*]   Build with Conntrack support. (NEW)
        [*]   Build with NO_ID. (hide *.bind pseudo domain) (NEW)
        [*]   Build with HAVE_BROKEN_RTC.
        [*]   Build with TFTP server support. (NEW)

    Administration  --->
        <*> htop........................................ Interactive processes viewer
        [*]   Compile Htop with lm-sensors support

    Kernel modules  --->
        Network Support  --->
            <*> kmod-tcp-bbr.................................. BBR TCP congestion control
            <*> kmod-veth................................... Virtual ethernet pair device
            <*> kmod-vrf........................... Virtual Routing and Forwarding (Lite)
            {*} kmod-vxlan................................... Native VXLAN Kernel support
            -*- kmod-wireguard........................... WireGuard secure network tunnel

    LuCI  --->
        2. Modules  --->
            Translations  ---> 
                <*> Japanese (ja)

        3. Applications  --->
            <*> luci-app-commands.............................. LuCI Shell Command Module
            <*> luci-app-https-dns-proxy..................... DNS Over HTTPS Proxy Web UI
            <*> luci-app-mwan3............... LuCI support for the MWAN3 MultiWAN Manager

        5. Protocols  --->
            <*> luci-proto-vxlan
            <*> luci-proto-wireguard........................... Support for WireGuard VPN

    Network  --->
        Routing and Redirection  --->
            <*> frr........................... The FRRouting (FRR) Software Routing Suite  --->
                -*-   frr-libfrr................................................. zebra library
                <*>   frr-bfdd............................................. bfdd routing engine
                <*>   frr-bgpd............................................. bgpd routing engine
                <*>   frr-pythontools....................................... Python reload tool
                <*>   frr-staticd....................................... staticd routing engine
                <*>   frr-vrrpd........................................... vrrpd routing engine
                <*>   frr-vtysh...................... integrated shell for frr routing software
                <*>   frr-watchfrr................................................ frr watchdog
                <*>   frr-zebra................................................... Zebra daemon

            <*> ip-full................................... Routing control utility (full)
            <*> mwan3........... Multiwan hotplug script with connection tracking support

        Time Synchronization  --->
            <*> chrony-nts.................. A versatile NTP client and server (with NTS)

        -*- https-dns-proxy..................................... DNS Over HTTPS Proxy
        <*> iftop............................. display bandwith usage on an interface

        VPN  --->
            <*> wireguard-tools................. WireGuard userspace control program (wg)

        Web Servers/Proxies  ---> 
            <*> cloudflared..................................... Cloudflare Tunnel client

    Utilities
        <*> dmesg............................ print or control the kernel ring buffer
        <*> shadow-utils.............................. The PLD Linux shadow utilities
              Select shadow utilities  --->
                [*] Include all PLD shadow utilities (NEW) 

        <*> prometheus-node-exporter-lua.................... Prometheus node exporter
        <*>   prometheus-node-exporter-lua-nat_traffic
        <*>   prometheus-node-exporter-lua-netstat
        <*>   prometheus-node-exporter-lua-openwrt
        <*>   prometheus-node-exporter-lua-textfile
        <*>   prometheus-node-exporter-lua-uci_dhcp_host

```

```text
Target System (Marvell EBU Armada)  --->
Subtarget (Marvell Armada 37x/38x/XP)  --->
Target Profile (Fortinet FortiGate 50E)  --->

Target Images  --->
    [*] ramdisk  ----
        *** Root filesystem archives ***
    [ ] cpio.gz (NEW)
    [ ] tar.gz
        *** Root filesystem images ***
    [ ] ext4 (NEW)  ----
    [*] squashfs (NEW)  --->
        *** Image Options ***
    (16) Kernel partition size (in MiB) (NEW)
    (104) Root filesystem partition size (in MiB) (NEW)
    [ ] Make /var persistent (NEW)

Global build settings
    [*] Include build configuration in firmware
    Kernel build options  --->
        [*] L3 Master device support

[*] Build the OpenWrt Image Builder
[ ] Build the OpenWrt SDK
[ ] Build the LLVM-BPF toolchain tarball
[ ] Package the OpenWrt-based Toolchain
[*] Image configuration  --->
    [*]   Version configuration options  --->
        (https://downloads.openwrt.org/releases/23.05.2) Release repository
        (https://github.com/naa0yama/OpenWrt-FortiGate-50E-custom-image/releases) Release Homepage
        (naa0yama) Manufacturer name
        (https://github.com/naa0yama) Manufacturer URL

    Kernel modules  --->
        Network Support  --->
            <*> kmod-tcp-bbr.................................. BBR TCP congestion control
            <*> kmod-veth................................... Virtual ethernet pair device
            <*> kmod-vrf........................... Virtual Routing and Forwarding (Lite)
            {*} kmod-vxlan................................... Native VXLAN Kernel support
            -*- kmod-wireguard........................... WireGuard secure network tunnel

```

Packages

```bash
cloudflared
dmesg
frr
frr-bfdd
frr-bgpd
frr-libfrr
frr-pythontools
frr-staticd
frr-vrrpd
frr-vtysh
frr-watchfrr
frr-zebra
htop
https-dns-proxy
iftop
ip-full
kmod-iptunnel
kmod-tcp-bbr
kmod-udptunnel4
kmod-udptunnel6
kmod-veth
kmod-vrf
kmod-vxlan
kmod-wireguard
luci-app-commands
luci-app-https-dns-proxy
luci-app-natmap
luci-app-ttyd
luci-proto-vxlan
luci-proto-wireguard
prometheus-node-exporter-lua
prometheus-node-exporter-lua-nat_traffic
prometheus-node-exporter-lua-netstat
prometheus-node-exporter-lua-openwrt
prometheus-node-exporter-lua-textfile
prometheus-node-exporter-lua-uci_dhcp_host
uhttpd-mod-lua
vxlan
wireguard-tools

```

## Local build

[[OpenWrt Wiki] Build system setup](https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem)

```bash
export BUILD_OPENWRT_VERSION="v23.05.2"

# Download and update the sources
git clone --verbose --progress --depth 1 --branch "${BUILD_OPENWRT_VERSION}" \
    https://github.com/openwrt/openwrt.git

# feed from GitHub miror.
cd openwrt
sed -i'' -e 's@git.openwrt.org/feed@github.com/openwrt@g' ./feeds.conf.default
sed -i'' -e 's@git.openwrt.org/project@github.com/openwrt@g' ./feeds.conf.default

# Update the feeds
./scripts/feeds update -a
./scripts/feeds install -a

# Expand to full config
cp ../config/mvebu-cortexa9-fortinet_fg-50e.ini .config
make defconfig

time make --directory ./ -j $(($(nproc)+1)) clean
time make --directory ./ -j $(($(nproc)+1)) download
time make --directory ./ -j $(($(nproc)+1)) world

```

## 公式の設定ファイル

```bash
curl -o .config https://downloads.openwrt.org/releases/23.05.2/targets/mvebu/cortexa9/config.buildinfo

```

## 差分のみ抽出

```bash
./scripts/diffconfig.sh > .config.diff.ini

```

## full config に変換

```bash
make defconfig

```

### 大体の build 時間の推移

|      min | exec time | make func | func                                 |
| -------: | --------: | :-------- | :----------------------------------- |
|        - |  16:17:03 |           | tools/flock/compile                  |
|      03s |  16:17:06 | download  | tools/download                       |
|      11s |  16:17:17 | download  | toolchain/download                   |
|   02m52s |  16:20:09 | download  | package/download                     |
|      09s |  16:21:12 | download  | target/download                      |
|      12s |  16:21:21 | world     | world                                |
|       0s |  16:21:23 | compile   | tools/compile                        |
|       0s |  16:21:23 | cleanup   | package/cleanup                      |
| 1h12m07s |  17:33:30 | compile   | toolchain/compile                    |
|   16m54s |  17:50:24 | compile   | target/compile                       |
|   15m14s |  18:05:38 |           | buildinfo                            |
|       0s |  18:05:38 | compile   | package/compile                      |
|       2s |  18:05:40 |           | diffconfig buildversion feedsversion |
|       3s |  18:05:43 |           | scripts/config/conf                  |
|   41m44s |  18:47:27 | install   | package/install                      |
|      11s |  18:47:38 | install   | target/install                       |
|      54s |  18:48:32 |           | package/index                        |
|      11s |  18:48:43 |           | json_overview_image_info             |
|       2s |  18:48:45 |           | checksum                             |
|          |           |           |                                      |
| 2h31m00s |  18:48:47 |           | real                                 |
| 8h32m00s |  18:48:47 |           | user                                 |
|   55m00s |  18:48:47 |           | sys                                  |

### 容量

```bash
$ cat disk_before
137     .
51      ./tmp
49      ./target
19      ./package
14      ./.git
2       ./tools
2       ./scripts
1       ./toolchain
1       ./staging_dir
1       ./include
1       ./config
1       ./LICENSES
1       ./.github

$ cat disk_after 
8589    .
6339    ./build_dir
1155    ./staging_dir
799     ./dl
162     ./bin
52      ./tmp
49      ./target
19      ./package
14      ./.git
2       ./tools
2       ./scripts
1       ./toolchain
1       ./include
1       ./config
1       ./LICENSES
1       ./.github

```

## ImageBuilder

```bash
export OPENWRT_VERSION="23.05.2"

wget "https://downloads.openwrt.org/releases/${OPENWRT_VERSION}/targets/mvebu/cortexa9/openwrt-imagebuilder-${OPENWRT_VERSION}-mvebu-cortexa9.Linux-x86_64.tar.xz"

mkdir -p buildtool && tar -Jxf openwrt-imagebuilder-*.tar.xz --strip-components 1 -C ./buildtool && cd buildtool

```

```bash
time make clean && make image PROFILE="fortinet_fg-50e" PACKAGES=""

```
