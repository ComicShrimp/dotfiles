#!/bin/bash

sudo tee /etc/systemd/resolved.conf >/dev/null <<'EOF'
[Resolve]
DNSOverTLS=no
EOF
  
# Allow network interfaces to use DHCP DNS
for file in /etc/systemd/network/*.network; do
  [[ -f "$file" ]] || continue
  sudo sed -i '/^UseDNS=no/d' "$file"
done

sudo systemctl restart systemd-networkd systemd-resolved
