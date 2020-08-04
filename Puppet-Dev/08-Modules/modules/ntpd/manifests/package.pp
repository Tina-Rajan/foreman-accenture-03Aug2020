class ntpd::package {

  package { 'ntp':
   ensure => 'installed',
  }

}
