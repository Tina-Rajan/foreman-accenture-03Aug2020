node 'server101.example.com' {


}


node 'node105.example.com' {

  file { '/etc/motd':
    ensure => 'present',
    content => 'This Node is Managed By Puppet - Demo Presented by AV'

  }

}
