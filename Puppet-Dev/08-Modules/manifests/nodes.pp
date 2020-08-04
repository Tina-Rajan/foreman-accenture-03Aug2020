node 'server101.example.com' {
  include linux
  include ntpd
}


node 'node105.example.com' {
  include linux
  include ntpd
  include admintools
}

