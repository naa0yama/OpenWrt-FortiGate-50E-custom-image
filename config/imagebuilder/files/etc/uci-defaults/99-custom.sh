#!/usr/bin/env sh

cat << "EOF" > /etc/uci-defaults/99-custom
uci -q batch << EOI
uci set firewall.@defaults[0].flow_offloading='1'
uci set irqbalance.irqbalance.enabled='1'
uci set system.@system[0].timezone='JST-9'

EOI
EOF