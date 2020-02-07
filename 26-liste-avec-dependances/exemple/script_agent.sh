
################# installation consul  ###########################

apt-get update

apt-get install -y wget unzip dnsutils python-flask net-tools

wget https://releases.hashicorp.com/consul/1.4.0/consul_1.4.0_linux_amd64.zip
unzip consul_1.4.0_linux_amd64.zip
mv consul /usr/local/bin/ 
groupadd --system consul
useradd -s /sbin/nologin --system -g consul consul 
mkdir -p /var/lib/consul 
chown -R consul:consul /var/lib/consul 
chmod -R 775 /var/lib/consul 
mkdir /etc/consul.d 
chown -R consul:consul /etc/consul.d



############### fichier de conf ###################################

echo '{
    "advertise_addr": "192.168.99.102",
    "bind_addr": "192.168.99.102",
    "client_addr": "0.0.0.0",
    "datacenter": "mydc",
    "data_dir": "/var/lib/consul",
    "domain": "consul",
    "enable_script_checks": true,
    "dns_config": {
            "enable_truncate": true,
            "only_passing": true
        },
    "enable_syslog": true,
    "encrypt": "TeLbPpWX41zMM3vfLwHHfQ==",
    "leave_on_terminate": true,
    "log_level": "INFO",
    "rejoin_after_leave": true,
    "retry_join": [
    "192.168.99.102"
    ]
}' >/etc/consul.d/config.json


################## service systemD ########################################


echo '[Unit]
Description=Consul Service Discovery Agent
Documentation=https://www.consul.io/
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=consul
Group=consul
ExecStart=/usr/local/bin/consul agent \
  -node=192.168.99.102 \
  -bind=192.168.99.102 \
  -advertise=192.168.99.102 \
  -data-dir=/var/lib/consul \
  -config-dir=/etc/consul.d

ExecReload=/bin/kill -HUP $MAINPID
KillSignal=SIGINT
TimeoutStopSec=5
Restart=on-failure
SyslogIdentifier=consul

[Install]
WantedBy=multi-user.target' >/etc/systemd/system/consul.service


####################### service consul ####################################


echo '
{"service":
        {
    "name": "wartest",
    "tags": ["dev"],
    "port": 80,
    "check": {
      "http": "http://localhost:80/",
      "interval": "3s"
    }
  }
}
' > /etc/consul.d/monservice.json
