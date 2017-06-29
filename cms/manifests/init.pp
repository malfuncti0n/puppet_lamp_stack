# Class: cms
# ===========================
#
# Full description of class cms here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'wordpress':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class cms {
	#load configuration file
	class { 'cms::config': }
	
	#Install Apache with php support
	class { 'cms::webserver': }

	#Install MySQL
	class { 'cms::dbserver': 
                require => Notify['PHP Installation Complete']
	}

	#Install php modules
	class { 'cms::php': 
                require => Notify['Apache Installation Complete']
	}

        #Install Wordpress after apache installation
        class { 'cms::wordpress': 
		require => Notify['MySQL Installation Complete']
	}

        #fix file permittions
        class { 'cms::permitions':
                require => Notify['Wordpress Installation Complete']
        }


    # message for mysql installation completion
    notify { 'MySQL Installation Complete':
        require => Class['cms::dbserver']
    }

    # message for apache installation completion
    notify { 'Apache Installation Complete':
        require => Class['cms::webserver']
    }

    # message for php installation completion                
    notify { 'PHP Installation Complete':
        require => Class['cms::php']
    }


    # message for wordpress installtion completion
    notify { 'Wordpress Installation Complete':
        require => Class['cms::wordpress']
    }

}
