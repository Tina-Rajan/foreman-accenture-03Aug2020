# Foreman Installation 
## Clone the CentOS Existing VM & Create a new Virtual Machine named Foreman


## Open Cmder : ssh root@192.168.56.101 
## Credentials 
```
Username: root 
Password: redhat
```
## Enable Foreman & Respective Repos. 
```
yum -y localinstall https://yum.theforeman.org/releases/2.0/el7/x86_64/foreman-release.rpm
yum -y localinstall https://fedorapeople.org/groups/katello/releases/yum/3.15/katello/el7/x86_64/katello-repos-latest.rpm
yum -y localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum -y localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install foreman-release-scl
yum -y update 
yum -y install katello 
```


## Foreman Installer & Secnarios
```
foreman-installer --scenario katello --help
```


## Install Foreman, Katello along with Smart Proxy ( DNS, DHCP, TFTP & Puppet ) 

```
foreman-installer --scenario katello --foreman-initial-admin-username admin --foreman-initial-admin-password "redhat@123" --foreman-proxy-dhcp true \
--foreman-proxy-dhcp-managed true \
--foreman-proxy-dhcp-gateway "192.168.255.1" \
--foreman-proxy-dhcp-interface "enp0s9" \
--foreman-proxy-dhcp-nameservers "192.168.255.2" \
--foreman-proxy-dhcp-range "192.168.255.10 192.168.255.110" \
--foreman-proxy-dhcp-server "192.168.255.2" \
--foreman-proxy-dns true \
--foreman-proxy-dns-managed true \
--foreman-proxy-dns-forwarders "8.8.8.8; 8.8.4.4" \
--foreman-proxy-dns-interface "enp0s9" \
--foreman-proxy-dns-reverse "255.168.192.in-addr.arpa" \
--foreman-proxy-dns-server "127.0.0.1" \
--foreman-proxy-dns-zone "example.com" \
--foreman-proxy-tftp true \
--foreman-proxy-tftp-managed true \
--foreman-proxy-puppetca true \
--foreman-proxy-puppet true

```
