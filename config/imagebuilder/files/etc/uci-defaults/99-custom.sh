#!/usr/bin/env sh
# DO NOT prefix 'uci'

cat << "EOF" > /etc/uci-defaults/99-custom
uci -q batch << EOI
set firewall.@defaults[0].flow_offloading='1'
set irqbalance.irqbalance.enabled='1'
set system.@system[0].timezone='JST-9'

EOI
EOF
