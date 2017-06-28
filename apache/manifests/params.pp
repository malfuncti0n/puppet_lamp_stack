class apache::params {
        
  if $::osfamily == 'RedHat' {
    $apacheName     = 'httpd'        
  } elseif $::osfamily == 'Debian' {
    $apacheName     = 'apache2'
  } else {
    print "This is not a supported distro."
  }
        
}
