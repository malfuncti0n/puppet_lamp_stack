class apache (
  $apacheName   = $::apache::params::apacheName,
) inherits ::apache::params {
          
  package { 'apache':
    name    => $apacheName,
    ensure  => present,
  }
        
  file { 'configuration-file':
    path    => $confFile,
    ensure  => file,
    source  => $confSource,
    notify  => Service['apache-service'],
  }

  service { 'apache-service':
    name          => $apacheName,
    hasrestart    => true,
  }

}

