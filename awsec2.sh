#!/bin/bash
sudo yum install -y python-setuptools
sudo easy_install pip
sudo pip install shadowsocks

echo "successful install shadowsocks server"
sleep 1000

cat <<EOF | sudo tee  /etc/shadowsocks.json
{
    "server":"0.0.0.0",
    "port_password":{
     "8381":"8381",
     "8382":"8382",
     "8383":"8383"
     },
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}
EOF

sudo ssserver -c /etc/shadowsocks/config.json -d restart

sleep 1000

netstat -lpnt 



