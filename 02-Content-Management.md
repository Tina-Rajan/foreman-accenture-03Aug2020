## 

## Importing GPG Key for OS Repo
After creating a product we need to import the GPG key for it. Follow below steps to import the key from CLI
```
# mkdir -p /etc/pki/rpm-gpg/import
# wget -P /etc/pki/rpm-gpg/import/ http://mirror.centos.org/centos-7/7/os/x86_64/RPM-GPG-KEY-CentOS-7
```

## To import the key for our organization, Run this command from the location where we have downloaded the GPG key.
```
# cd /etc/pki/rpm-gpg/import
# hammer gpg create --organization-id 1 --key "RPM-GPG-KEY-CentOS-7" --name "RPM-GPG-KEY-CentOS-7"
```

## Creating Product from CLI using the hammer.
```
# hammer product create --organization-id 1 --name "CentOS 7 Linux x86_64" --description "Repository for CentOS 7 Linux"
```

## Creating Repositories

### Repo 1: CentOS 7 Linux x86_64
```
# hammer repository create --organization-id 1 \
   --product "CentOS 7 Linux x86_64" \
   --name "CentOS 7 OS x86_64" \
   --label "CentOS_7_OS_x86_64" \
   --content-type "yum" \
   --download-policy "on_demand" \
   --gpg-key "RPM-GPG-KEY-CentOS-7" \
   --url "http://mirror.centos.org/centos-7/7/os/x86_64/" \
   --mirror-on-sync "no"
```

### Repo 2: CentOS 7 Linux x86_64
```
# hammer repository create --organization-id 1 \
   --product "CentOS 7 Linux x86_64" \
   --name "CentOS 7 Extra x86_64" \
   --label "CentOS_7_Extra_x86_64" \
   --content-type "yum" \
   --download-policy "on_demand" \
   --gpg-key "RPM-GPG-KEY-CentOS-7" \
   --url "http://mirror.centos.org/centos-7/7/extras/x86_64/" \
   --mirror-on-sync "no"
```

### Repo 3: CentOS 7 Linux x86_64
```
# hammer repository create --organization-id 1 \
   --product "CentOS 7 Linux x86_64" \
   --name "CentOS 7 Updates x86_64" \
   --label "CentOS_7_Updates_x86_64" \
   --content-type "yum" \
   --download-policy "on_demand" \
   --gpg-key "RPM-GPG-KEY-CentOS-7" \
   --url "http://mirror.centos.org/centos-7/7/updates/x86_64/" \
   --mirror-on-sync "no"
```

### Repo 4: Ansible x86_64
```
# hammer repository create --organization-id 1 \
    --product "CentOS 7 Linux x86_64" \
    --name "Ansible x86_64" \
    --label "Ansible_x86_64" \
    --content-type "yum" \
    --download-policy "on_demand" \
    --gpg-key "RPM-GPG-KEY-CentOS-7" \
    --url "http://mirror.centos.org/centos-7/7/configmanagement/x86_64/ansible29/" \
    --mirror-on-sync "no"
```


## Now lets create a Storage Repo also. 

```
wget -P /etc/pki/rpm-gpg/import/ https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Storage
# hammer gpg create --organization-id 1 --key "RPM-GPG-KEY-CentOS-SIG-Storage" --name "RPM-GPG-KEY-CentOS-SIG-Storage"
```

## Repo 5: Finally, We add storage repository 
```
# hammer repository create --organization-id 1 \
 --product "CentOS 7 Linux x86_64" \
    --name "Storage x86_64" \
    --label "Storage_x86_64" \
    --content-type "yum" \
    --download-policy "on_demand" \
    --gpg-key "RPM-GPG-KEY-CentOS-SIG-Storage" \
    --url "http://mirror.centos.org/centos-7/7/storage/x86_64/ceph-nautilus/" \
    --mirror-on-sync "no"
```




# Disconnected Channel / Contect Sync

## Download Contect ISO from the mirror link, ( In my case we'll be using CentOS Everything ISO) 

```
Here is the dowoload link : ( http://centos.mirror.snu.edu.in/centos/7.8.2003/isos/x86_64/CentOS-7-x86_64-Everything-2003.iso )
```
## Create a Diectory inside Foreman & Host the content of ISO Image via HTTPD.

```
mkdir -p /var/www/html/pub/sat-content
mount -o loop CentOS-7-x86_64-Everything-2003.iso /var/www/html/pub/sat-content/
```

## Creating New Product from CLI using the hammer.
```
# hammer product create --organization-id 1 --name "CentOS7_Everything_Local" --description "CentOS7_Everything_Local"
```

## Creating Repositories

### Repo 1: CentOS7_Everything_Local_Repo
```
# hammer repository create --organization-id 1 \
   --product "CentOS7_Everything_Local" \
   --name "CentOS7_Everything_Local_Repo" \
   --label "CentOS7_Everything_Local_Repo" \
   --content-type "yum" \
   --download-policy "on_demand" \
   --gpg-key "RPM-GPG-KEY-CentOS-7" \
   --url "http://192.168.56.101/pub/sat-content/" \
   --mirror-on-sync "no"
```

