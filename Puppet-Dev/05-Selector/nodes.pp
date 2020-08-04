$ntpservice = $osfamily ? {
  'redhat' => 'ntpd',
  'debain' => 'ntp',
  defualt  => 'ntp',
  }

node 'server101.example.com' {



  file { '/tmp/info.txt':
    ensure => 'present',
    content => inline_template("Created by Puppet at <%= Time.now %>\n")
  }

  package { 'ntp':
   ensure => 'installed',
  }

  service { $ntpservice:
   ensure => 'running',
   enable => 'true',
  }
}


node 'node105.example.com' {

  file { '/etc/motd':
    ensure => 'present',
    content => 'This Node is Managed By Puppet - Demo Presented by AV'
  }

  file { '/tmp/info.txt':
    ensure => 'present',
    content => inline_template("Created by Puppet at <%= Time.now %>\n")
  }

}
