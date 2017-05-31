##########################################################################
#  Puppet configuration file                                             #
#                                                                        #
#  Copyright (C) 2014-2017 EDF S.A.                                      #
#  Contact: CCN-HPC <dsp-cspit-ccn-hpc@edf.fr>                           #
#                                                                        #
#  This program is free software; you can redistribute in and/or         #
#  modify it under the terms of the GNU General Public License,          #
#  version 2, as published by the Free Software Foundation.              #
#  This program is distributed in the hope that it will be useful,       #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of        #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         #
#  GNU General Public License for more details.                          #
##########################################################################

class fusioninventory::params {

#### Module variables

  $packages        = [ 'fusioninventory-agent' ]
  $packages_ensure = 'present'
  $config_file     = '/etc/fusioninventory/agent.cfg'

  case $::osfamily {
    'Debian': {
      $default_file = '/etc/default/fusioninventory-agent'
    }
    'Redhat': {
      $default_file = '/etc/sysconfig/fusioninventory-agent'
    }
    default: {
      fail("Unsupported OS Family: ${::osfamily}")
    }
  }


#### Defaults values

  $config_options = {
    logger => 'stderr',
  }
  $default_options = {
    'MODE' => 'cron',
  }
}
