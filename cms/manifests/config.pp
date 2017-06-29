class cms::config {
    
    #choose between joomla and wordpress
    $cms=wordpress
    #apache configuration
    $servername='serverexpose.com'


    #mysql configuration
    $root_password = 'password'
    $db_name = 'db_name'
    $db_user = 'db_user'
    $db_user_password = 'user_password'
    $db_host = 'localhost'

    # host
    $db_user_host = "${db_user}@${db_host}"

    # This will evaluate to host with db.*
    $db_user_host_db = "${db_user}@${db_host}/${db_name}.*"
}

