class apache::params {

  if $::osfamily == 'RedHat' {
    $apacheName     = 'httpd'
    $confFile       = '/etc/httpd/conf/httpd.conf'
    $confSource     = 'puppet:///modules/apache/httpd.conf'
  } elsif $::osfamily == 'Debian' {
    $apacheName     = 'apache2'
    $confFile       = '/etc/apache2/apache2.conf'
    $confSource     = 'puppet:///modules/apache/apache2.conf'
  } else {
	err("Not supported OS")
  }

}
