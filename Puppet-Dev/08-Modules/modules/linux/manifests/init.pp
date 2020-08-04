class linux { 
  file { '/etc/motd':
    ensure => 'present',
    source => 'puppet:///modules/linux/motd',
 }
}
