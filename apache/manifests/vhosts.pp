class apache::vhosts {
        
  if $::osfamily == 'RedHat' {
    file { '/etc/httpd/conf.d/vhost.conf':
      ensure    => file,
      content   => template('apache/vhosts-redhat.conf.erb'),
    }
    file { "/var/www/$servername":
      ensure    => directory,
    }
    file { "/var/www/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/log/httpd/$servername":
    ensure    => directory,
    }
    file { "/var/log/httpd/$servername/log":
    ensure    => directory,
    }
        
  } elsif $::osfamily == 'Debian' {
    file { "/etc/apache2/sites-available/$servername.conf":
      ensure  => file,
      content  => template('apache/vhosts-debian.conf.erb'),
    }
    file { "/var/www/$servername":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/log/apache2":
      ensure    => directory,
    }
    file { "/var/log/apache2/$servername":
      ensure    => directory,
    }
    file { "/var/log/apache2/$servername/logs":
      ensure    => directory,
    }
  } else {
	err("Not supported OS")
  }
        
}
