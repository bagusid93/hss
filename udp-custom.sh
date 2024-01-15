#!/bin/bash

    cd
    rm -rf *
    wget -O /usr/bin/udp-custom "https://github.com/bagusid93/hss/raw/main/udp-custom-linux-amd64" >/dev/null 2>&1
    chmod +x /usr/bin/udp-custom
    mv * /usr/bin/
    
    
    cat >/usr/bin/config.json <<-END
{
  "listen": ":36712",
  "stream_buffer": 33554432,
  "receive_buffer": 83886080,
  "auth": {
    "mode": "passwords"
  }
}
END

    cat >/etc/systemd/system/udp-custom.service <<EOF
[Unit]
Description=Udp-Custom VPN Server By Julak Bantur Feat Epro Dev Team
After=network.target

[Service]
User=root
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/udp-custom server -exclude 2200,7300,7200,7100,323,10008,10004 /usr/bin/config.json
Environment=HYSTERIA_LOG_LEVEL=info
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_RAW
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_RAW
NoNewPrivileges=true
LimitNPROC=10000
LimitNOFILE=1000000
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable udp-custom
systemctl start udp-custom
systemctl restart udp-custom
