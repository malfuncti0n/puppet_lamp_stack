class wordpress::web {

    # Install Apache
    class {'apache': 
        mpm_module => 'prefork'

    }

	apache::vhost { "${wordpress::config::severname}" :
	  port          => '80',
	  docroot       => "/var/www/html/${wordpress::config::severname}",
	  docroot_owner => 'www-data',
	  docroot_group => 'www-data',
} 
    # Add support for PHP 
    class {'::apache::mod::php': }

}
