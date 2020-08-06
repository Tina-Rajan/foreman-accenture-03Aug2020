# Activation Key

## List the Org. 
```
# hammer organization list
```
```
---|----------------------|----------------------|-----------------------------------------|---------------------
ID | TITLE                | NAME                 | DESCRIPTION                             | LABEL               
---|----------------------|----------------------|-----------------------------------------|---------------------
1  | Default Organization | Default Organization |                                         | Default_Organization
3  | Example Org          | Example Org          | This is the sample origination for demo | example-org         
---|----------------------|----------------------|-----------------------------------------|---------------------
```

## List the Lifecycle Environments
```
# hammer lifecycle-environment list
```
```
---|-------------------------|------------------------
ID | NAME                    | PRIOR                  
---|-------------------------|------------------------
5  | Devlopement             | MyProductLifeCycle-AppA
2  | Library                 |                        
1  | Library                 |                        
4  | MyProductLifeCycle-AppA | Library                
7  | Production              | Stage                  
6  | Stage                   | Devlopement            
---|-------------------------|------------------------
```



## List the Content Views
```
#  hammer content-view list
```
```
----------------|----------------------------|--------------------------------------|-----------|---------------------|---------------
CONTENT VIEW ID | NAME                       | LABEL                                | COMPOSITE | LAST PUBLISHED      | REPOSITORY IDS
----------------|----------------------------|--------------------------------------|-----------|---------------------|---------------
4               | CentOS7 Packages           | CentOS7_Packages                     | false     | 2020/08/05 09:06:56 | 1, 2, 3       
5               | CentOS7_Puppet_Custom_View | CentOS7_Puppet_Custom_View           | true      | 2020/08/06 05:39:30 | 11, 12, 13    
2               | Default Organization View  | 7655f6fe-f80a-4767-9026-b07c1b24c4bf | false     | 2020/08/03 08:51:45 |               
1               | Default Organization View  | Default_Organization_View            | false     | 2020/08/03 06:09:33 |               
6               | Puppet_Custom_View         | Puppet_Custom_View                   | false     | 2020/08/06 05:37:18 |               
----------------|----------------------------|--------------------------------------|-----------|---------------------|---------------
```


## Create the activation Key Named as : Mykey_CentOS7_Prod

```
# hammer activation-key create --organization-id 1 --name Mykey_CentOS7_Prod --lifecycle-environment Production --content-view CentOS7 Packages --unlimited-hosts
```

## List the Activation Key
```
#  hammer activation-key list --organization-id 1
```
```
---|--------------------|----------------|-----------------------|---------------------------
ID | NAME               | HOST LIMIT     | LIFECYCLE ENVIRONMENT | CONTENT VIEW              
---|--------------------|----------------|-----------------------|---------------------------
1  | Mykey_CentOS7_Dev  | 0 of Unlimited | Devlopement           | CentOS7_Puppet_Custom_View
3  | Mykey_CentOS7_Prod | 1 of Unlimited | Production            | CentOS7 Packages          
---|--------------------|----------------|-----------------------|---------------------------
```



## Clinet Registartion with Activation Key
```
# subscription-manager register --org=Default_Organization --activationkey=Mykey_CentOS7_Prod
```


## if you want to Delete the Activation Key
```
# hammer activation-key create --organization-id 1 --name Mykey_CentOS7_Prod --lifecycle-environment Production --content-view CentOS7 Packages --unlimited-hosts
```
```
Activation key deleted.
```
