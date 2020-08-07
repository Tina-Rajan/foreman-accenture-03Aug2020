# Foreman Backup 

## Update the Foreman maintance Package. 
```
# yum install -y https://yum.theforeman.org/releases/2.1/el7/x86_64/rubygem-foreman_maintain-0.6.4-1.el7.noarch.rpm
```

## Check the Foreman Service Status
```
# foreman-maintain service list
```

```
# foreman-maintain service status
```

## Getting Ready For Backup

### Craete Backup Dir. with Right Set of Permissions
```
# umask 0027; export BDIR=/backup ; mkdir -p $BDIR ; chmod 770 $BDIR ; chgrp postgres $BDIR
# ls -ld $BDIR
```

## Initiate Online Full Backup excluding Pulp Dir
```
# foreman-maintain backup online --skip-pulp-content -y  $BDIR
```


## Initiate Online Full Backup including Pulp Dir
```
# foreman-maintain backup online -y  $BDIR
```
