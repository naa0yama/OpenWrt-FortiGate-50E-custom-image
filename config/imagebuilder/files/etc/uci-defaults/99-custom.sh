#!/usr/bin/env sh
# DO NOT prefix 'uci'

uci -q batch <<-EOF >/dev/null
  set firewall.@defaults[0].flow_offloading='1'
  set irqbalance.irqbalance.enabled='1'
  set system.@system[0].timezone='JST-9'
  commit
EOF

exit 0
