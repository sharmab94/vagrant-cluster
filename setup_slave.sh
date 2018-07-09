#!/bin/bash

sudo sed -i -e 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis.conf
sudo sed -i -e 's/# requirepass.*/requirepass redis/g' /etc/redis.conf
sudo sed -i -e 's/# slaveof <masterip> <masterport>/slaveof 172.20.10.200 6379/g' /etc/redis.conf
sudo sed -i -e 's/# masterauth.*/masterauth redis/g' /etc/redis.conf
sudo systemctl restart redis.service