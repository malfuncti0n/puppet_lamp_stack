class apache (
  $apacheName   = $::apache::params::apacheName,
) inherits ::apache::params {
          
  package { 'apache':
    name    => $apacheName,
    ensure  => present,
  }
        
}

