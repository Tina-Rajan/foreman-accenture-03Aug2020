class admintools {

 $admintool = ['git', 'nano', 'screen' ]

  package { $admintool:
    ensure => 'installed'
  }
}
