# Setting up Foreman Puppet Environment

## Create a new view name : Puppet_custom_view
```
Dashboard -> Content -> Content Views -> Create New Content View

Name: Puppet_Custom_Content_View -> Create/Save.

Inside the content_view -> Puppet_modules -> add modules -> select the right version. ( Repeat the same for all the modules ) -> Publish New Version (v1).

Now promote the Puppet_Custom_Content_View -> Dev (Environment)
```


## Create a new composit view name : CentOS7_Puppet_Custom_View
```
Name: CentOS7_Puppet_Custom_View -> Create/Save.
Composit View :  [*]


-> Content_Views -> Add -> ( CentOS 7 Packages  & Puppet_custom_view ) -> add content view -> Save -> Publish New Version. 

Now promote the CentOS7_Puppet_Custom_View -> Dev (Environment)
```


## Subscribe the host / clinet with new composite view CentOS7_Puppet_Custom_View
```
Hosts -> All Hosts -> click ( clinet102.example.com  ) -> Edit -> Select the following Attribute

Lifecycle Env :  Dev
Content View  :  CentOS7_Puppet_Custom_View
Content Source:  server101.example.com
Puppet Env    :  KT_Default_Orgination_Library_CentOS7_Puppet_Custom_View
Puppet Master :  server101.example.com
Puppet CA     :  server101.example.com
  

Puppet Classes -> add ( Linux ) Only.

Submit.
```

## Login to the clinet node (node02) & install puppet agent.
```
yum install https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum install puppet-agent
```

## Genrate Puppet CRS Request.
```
cd /opt/puppetlabs/bin/
./puppet agent -t --server=server101.example.com
```


## Now go back to Foreman Puppet Master & Accept the CSR Request / Sign the Certificate
```
Dashboard -> Infrastructure -> Smart Proxis -> click on the name -> Select Puppet CA -> Certificates -> sign (node2) cert req.
```


## Now go back to clinet & run puppet agent
```
cd /opt/puppetlabs/bin/
./puppet agent -t 
```


