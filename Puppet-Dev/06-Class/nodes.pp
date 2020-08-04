node 'server101.example.com' {
  class {'motd': }
  class {'info': }
  class {'ntp': }
}


node 'server102.example.com' {
  class {'info': }
}



class motd {
  file { '/etc/motd':
    ensure => 'present',
    content => 'Host is Managed by Foreman Puppet Server',
  }
}


class info { 

  file { '/tmp/info.txt':
    ensure => 'present',
    content => inline_template("Created by Puppet Class at <%= Time.now %>\n")
  }

}


class ntp {

$ntpservice = $osfamily ? {
  'redhat' => 'ntpd',
  'debain' => 'ntp',
  defualt  => 'ntp',
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
    content => 'This Node is Managed By Puppet - Scheduled - Puppet Agent'
  }

  file { '/tmp/info.txt':
    ensure => 'present',
    content => inline_template("Created by Puppet at <%= Time.now %>\n")
  }

}
