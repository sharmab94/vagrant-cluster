#!/bin/bash

sudo yum install -y wget unzip 
# downloading consul zip
wget -q https://releases.hashicorp.com/consul/1.2.0/consul_1.2.0_linux_amd64.zip
unzip -oqq consul_1.2.0_linux_amd64.zip
rm -rf consul_1.2.0_linux_amd64.zip

sudo chmod +x consul
sudo cp -r consul /usr/bin/consul
sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d

# setup consul to run as a systemd service
cd /etc/systemd/system
sudo cp /vagrant/consul.service  consul.service
sudo chmod 644 consul.service
sudo systemctl daemon-reload
echo "consul has been installed as a systemd service"

# start consul service
sudo systemctl start consul
echo "consul systemd service started"
#Process is getting hung, need to figure out how to exit process, #todo: need to start as a service
sudo /usr/bin/consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul -bind 172.20.10.201 -client 172.20.10.201 -join 172.20.10.200 &
wait
echo -ne "n/"
echo "running consul members check"
/home/vagrant/consul members
echo "done"
