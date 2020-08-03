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


## Installation Finished
```
Preparing installation Done
  Success!
  * Foreman is running at https://server101.example.com
      Initial credentials are admin / redhat@123
  * To install an additional Foreman proxy on separate machine continue by running:

      foreman-proxy-certs-generate --foreman-proxy-fqdn "$FOREMAN_PROXY" --certs-tar "/root/$FOREMAN_PROXY-certs.tar"
  * Foreman Proxy is running at https://server101.example.com:9090
  The full log is at /var/log/foreman-installer/katello.log
[root@server101 ~]#
```

## Disable Linux System Firewall
```
[root@server101 ~]# iptables -F
[root@server101 ~]# systemctl disable firewalld
Removed symlink /etc/systemd/system/multi-user.target.wants/firewalld.service.
Removed symlink /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service.
[root@server101 ~]#
```

## Now we can access our forman with the mentioend URL : https://server101.example.com  & Initial credentials are admin / redhat@123


## List the Users
```
[root@server101 ~]# hammer user list
---|--------------|---------------|----------------------------|-------|---------------------|--------------
ID | LOGIN        | NAME          | EMAIL                      | ADMIN | LAST LOGIN          | AUTHORIZED BY
---|--------------|---------------|----------------------------|-------|---------------------|--------------
4  | admin        | Admin User    | root@example.com           | yes   | 2020/08/03 09:24:56 | Internal
6  | exampleview  | example view  | exampleview@localhost      | no    | 2020/08/03 09:21:21 | Internal
5  | exampleadmin | example admin | exampleadmin@localhost.com | no    | 2020/08/03 09:23:49 | Internal
---|--------------|---------------|----------------------------|-------|---------------------|--------------
[root@server101 ~]#
```

## List the Organizations 
```
[root@server101 ~]# hammer organization list
---|----------------------|----------------------|-----------------------------------------|---------------------
ID | TITLE                | NAME                 | DESCRIPTION                             | LABEL
---|----------------------|----------------------|-----------------------------------------|---------------------
1  | Default Organization | Default Organization |                                         | Default_Organization
3  | Example Org          | Example Org          | This is the sample origination for demo | example-org
---|----------------------|----------------------|-----------------------------------------|---------------------
[root@server101 ~]#
```
