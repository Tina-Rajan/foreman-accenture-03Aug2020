# Foreman & Katello Upgrade. 

### Foreman 2.0.1 -> 2.1
### Katello 3.15  -> 3.16


## Fisrt Update / Upgarde the Foreman Node.
```
# yum -y update
```

## Upgrade / Update Foreman Packages
```
foreman-rake katello:upgrade_check
yum -y update https://yum.theforeman.org/releases/2.1/el7/x86_64/foreman-release.rpm
```

## Upgrade / Update Katello Packages
```
yum -y update https://fedorapeople.org/groups/katello/releases/yum/3.16/katello/el7/x86_64/katello-repos-latest.rpm
```

## Upgrade / Update Foreman Release Packages
```
yum -y update foreman-release-scl
```

## If Foreman is self Registered then unregister the same.
```
subscription-manager remove --all
subscription-manager unregister
```

## Clean the Unregister Foreman Repos.
```
yum clean all
```

## Update the Required packages on Foreman Server
```
yum -y update
```


## Run the Foreman Installer to Normalized the Update with current Environment
```
foreman-installer
```

## Now login to Foreman & Enjoy. 
