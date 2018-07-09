#!/bin/bash

sudo sed -i -e 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis.conf
sudo sed -i -e 's/# requirepass.*/requirepass redis/g' /etc/redis.conf
sudo sed -i -e 's/# maxmemory-policy/maxmemory-policy/g' /etc/redis.conf
sudo sed -i -e 's/appendonly no/appendonly yes/g' /etc/redis.conf
sudo systemctl restart redis.service
