class { '::php':
  ensure       => latest,
  manage_repos => true,
  dev          => true,
  composer     => true,
  pear         => true,
    phpunit      => false,
    extensions => {
      bcmath    => {
        provider => apt,
       },
      curl    => {
        provider => apt,
       },
      json    => {
        provider => apt,
       },
      intl    => {
        provider => apt,
       },
      gd    => {
        provider => apt,
       },
      xml    => {
        provider => apt,
       },
      zip    => {
        provider => apt,
       },
      mbstring    => {
        provider => apt,
       },
      mcrypt    => {
        provider => apt,
       },
      soap    => {
        provider => apt,
       },
      imagick   => {
        provider => apt,
      },
      xmlrpc    => {
        provider => apt,
      },
      memcached => {
        provider => apt,
        header_packages => [ 'libmemcached-devel', ],
      },
    },
  settings   => {
    'PHP/max_execution_time'  => '180',
    'PHP/max_input_time'      => '90',
    'PHP/memory_limit'        => '128M',
    'PHP/post_max_size'       => '128M',
    'PHP/upload_max_filesize' => '127M',
    'Date/date.timezone'      => 'Europe/Authens',
  },
  }

