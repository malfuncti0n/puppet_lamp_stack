class cms::wordpress {

    # Copy Cms installation to node
    file { '/tmp/latest.tar.gz':
        ensure => present,
        source => "puppet:///modules/cms/latest.tar.gz"
    }

    # Extract cms
    exec { 'extract':
        cwd => "/tmp",
        command => "tar -xvzf latest.tar.gz",
        require => File['/tmp/latest.tar.gz'],
        path => ['/bin'],
    }

    # Copy to /var/www/html/$servername
    exec { 'copy':
        command => "cp -r /tmp/wordpress/* /var/www/html/${cms::config::servername}/",
        require => Exec['extract'],
        path => ['/bin'],
    }

    # Copy template wp.config
    file { "/var/www/html/${cms::config::servername}/wp-config.php":
        ensure => present,
        require => Exec['copy'],
        content => template("cms/wp-config.php.erb")
    }
}

