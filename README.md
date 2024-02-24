# OpenWrt FortiGate 50E custom image
OpenWrt custom image for Fortinet FortiGate 50E (FRRouting+VRF+veth+WireGuard)

```bash
docker build -t builder .

```

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

## Local build

[[OpenWrt Wiki] Build system setup](https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem)
