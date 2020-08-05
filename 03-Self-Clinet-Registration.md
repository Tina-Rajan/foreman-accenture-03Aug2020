# Foreman Self & Clinet Regestation. 

## Forman Server
### Import / Install Foreman CA Certificate
```
yum install subscription-manger -y
rpm -Uvh /var/www/html/pub/katello-ca-consumer-latest.noarch.rpm
```

### Unregister the Foreman Server
```
  subscription-manager remove --all
  subscription-manager unregister
```

### Self registration of Foreman Server
```
  subscription-manager register --org="Default_Organization" --environment="Library"
  subscription-manager list --available
  subscription-manager repos --list
  subscription-manager attach --pool 4028b8e573b32f940173b3d647dc000f
  subscription-manager repos --list
```

### Package Installation
```
  yum repolist
  yum install iotop -y 
```





## On client Nodes

### Import / Install Foreman CA Certificate
```
yum install subscription-manager wget -y
wget https://server101.example.com/pub/katello-ca-consumer-latest.noarch.rpm --no-check-certificate
rpm -Uvh /var/www/html/pub/katello-ca-consumer-latest.noarch.rpm
```


### Self registration of Foreman Server
```
  subscription-manager register --org="Default_Organization" --environment="Library"
  subscription-manager list --available
  subscription-manager repos --list
  subscription-manager attach --pool 4028b8e573b32f940173b3d647dc000f
  subscription-manager repos --list
```
