class ntpd::service {

$ntpservice = $osfamily ? {
  'redhat' => 'ntpd',
  'debain' => 'ntp',
  defualt  => 'ntp',
  }

  service { $ntpservice:
   ensure => 'stopped',
   enable => 'true',
  }

}
