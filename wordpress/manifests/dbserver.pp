class wordpress::dbserver {

    class { '::mysql::server':

        # Set the root mysql password
        root_password => $wordpress::config::root_password,

        # Create the database
        databases => {
            "${wordpress::config::db_name}" => {
                ensure => 'present',
                charset => 'utf8'
            }
        },

        # Create the user
        users => {
            "${wordpress::config::db_user_host}" => {
                ensure => present,
                password_hash => mysql_password("${wordpress::config::db_user_password}")
            }
        },

        # Grant privileges to the user
        grants => {
            "${wordpress::config::db_user_host_db}" => {
                ensure     => 'present',
                options    => ['GRANT'],
                privileges => ['ALL'],
                table      => "${wordpress::config::db_name}.*",
                user       => "${wordpress::config::db_user_host}",
            }
        },
    }

    # Install MySQL client and all bindings
    class { '::mysql::client':
        require => Class['::mysql::server'],
        bindings_enable => true
    }
}

