class cms::dbserver {

    class { '::mysql::server':

        # Set the root mysql password
        root_password => $cms::config::root_password,

        # Create the database
        databases => {
            "${cms::config::db_name}" => {
                ensure => 'present',
                charset => 'utf8'
            }
        },

        # Create the user
        users => {
            "${cms::config::db_user_host}" => {
                ensure => present,
                password_hash => mysql_password("${cms::config::db_user_password}")
            }
        },

        # Grant privileges to the user
        grants => {
            "${cms::config::db_user_host_db}" => {
                ensure     => 'present',
                options    => ['GRANT'],
                privileges => ['ALL'],
                table      => "${cms::config::db_name}.*",
                user       => "${cms::config::db_user_host}",
            }
        },
    }

    # Install MySQL client and all bindings
    class { '::mysql::client':
        require => Class['::mysql::server'],
        bindings_enable => true
    }
}

