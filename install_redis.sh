#!/bin/bash

sudo yum install -y epel-release
# sudo yum -y update
sudo yum install -y redis
sudo systemctl start redis.service
sudo systemctl status redis.service
#Test Redis Setup, command should return: PONG
redis-cli ping
