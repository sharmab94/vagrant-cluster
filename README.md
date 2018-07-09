# vagrant-cluster

Configures a Redis-Consul cluster in Vagrant
 
SETUP:
==============
1. Install vagrant
2. Install VirtualBox
3. Clone the project locally: git clone https://github.com/sharmab94/vagrant-cluster.git
4. Move into the project directory: cd vagrant-cluster
5. Install the vbguest plugin: vagrant plugin install vagrant-vbguest
6. Provision the virtual machines using Vagrant: vagrant up


CONFIGURATION:
==============
REDIS:
--------------
-Spins up 3 vms in the cluster:
1 Redis Master
2 Redis Slaves

-Installs Redis on all 3 VMs.
-Sets up 1 Redis-Master server
-Sets up 2 Redis-Slave servers

Validation for Redis (run on all 3 vms):
-Tests Redis Setup by running the following command:
redis-cli ping
Which should then return: PONG
-Runs a verify.sh script to make sure it is connected to Redis
Which should then return: OK

CONSUL:
--------------
-Installs consul agent on the Redis_master server
-Sets up consul as a service
-Starts the consul agent service

Validation for Consul Agent:
-Runs the consul members check, should return something like:
consul members check
    redis_master: Node                   Address             Status  Type    Build  Protocol  DC   Segment
    redis_master: localhost.localdomain  172.20.10.200:8301  alive   server  1.2.0  2         dc1  <all>
    redis_master: done

KNOWN ISSUES:
==============
-Network:
- Switching to a different range of network may cause issues. By default, the ip of the Vagrant master is set to: 172.20.10.200 in the Vagrant.config.yml.
If you are in a different network range (ex. 192.168.1.10, 10.0.0.0)
  1. Make sure to update Vagrant.config.yml with the correct ip of the network range you are in.
  2. Make sure to update the setup_slave.sh script, line 5 for the corresponding master ip. (current ip in script: 172.20.10.200)
 

 ADDITIONAL INFO:
 ==============
 Downloaded and used vagrant-provision-reboot-plugin: Originally adapted from: https://github.com/exratione/vagrant-provision-reboot
