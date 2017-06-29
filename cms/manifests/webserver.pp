class cms::webserver {

    # Install Apache
    class {'apache': 
        mpm_module => 'prefork'

    }

	apache::vhost { "${cms::config::servername}" :
	  port          => '80',
	  docroot       => "/var/www/html/${cms::config::servername}",
	  docroot_owner => 'www-data',
	  docroot_group => 'www-data',
} 
    # Add support for PHP 
    class {'::apache::mod::php': 
}

}
