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

class postfix::config inherits postfix {

  hpclib::print_config { $::postfix::config_file :
    style  => 'keyval',
    data   => $::postfix::_config_options,
    notify => Class['::postfix::service'],
  }

  create_resources(::postfix::alias, $::postfix::aliases)

  exec {'postfix_newaliases':
    command     => '/usr/bin/newaliases',
    refreshonly => true,
  }

}
