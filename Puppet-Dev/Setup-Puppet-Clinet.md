# Setup a Puppet Clinet. 

## Create a new VM as linked clone of our initial Foreman VM with reduced RAM : 4GB 
```
1. Configure the IP Address - 192.168.56.105 ( /etc/sysconfig/network-scripts/ifcfg-enp0s8 ) 
2. ifdown enp0s8; ifup enp0s8
3. Update the hostname:  hostname node105.example.com > /etc/hostname
4. Update the local Resolver like the following on both the servers ( Puppet Master & Node )  
```
```
[root@node105 ~]# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.56.101 server101.example.com puppet
192.168.56.105 node105.example.com node105
[root@node105 ~]#
```

```
5. Enable the Puppet Repo        : yum -y localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
6. Install the Puppet Agent      : yum -y install puppet
7. Export the Puppet Path        : export PATH=$PATH:/opt/puppetlabs/puppet/bin
8. Genrate a Certificate Request : puppet agent --server=server101.example.com
```



## Now let go the Puppet Master / Foreman
```
# puppetserver ca list
# puppetserver ca sign --certname node105.example.com
# puppetserver ca list --all
```

## Now we can create a manifest file named as nodes.pp with the following defination. 

```
[root@server101 ~]# cat /etc/puppetlabs/code/environments/production/manifests/nodes.pp
node 'server101.example.com' {


}


node 'node105.example.com' {

  file { '/etc/motd':
    ensure => 'present',
    content => 'This Node is Managed By Puppet - Demo Presented by Amit'

  }

}
[root@server101 ~]#

```
 


## Go the agent & run puppet command to apply the manifest
```
puppet agent -t 
```
