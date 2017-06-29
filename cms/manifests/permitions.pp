class cms::permitions {

#fix directory permitions

exec { 'www-data chown':
     command  => "/bin/chown -R www-data:www-data /var/www/html/${cms::config::servername}/",
     require  => File["/var/www/html/${cms::config::servername}/"],
     onlyif   => "/bin/ls -lhR /var/www/html/${cms::config::servername}/ | /bin/grep -i root",
}
}
