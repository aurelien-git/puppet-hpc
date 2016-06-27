##########################################################################
#  Puppet configuration file                                             #
#                                                                        #
#  Copyright (C) 2014-2016 EDF S.A.                                      #
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

#
define boothttp::printconfig (
  $os = 'calibre9'
) {

  $config_file     = "${::boothttp::install::disk_dir}/${os}/install_config"
  $template_file   = "boothttp/install_config.${os}.erb"
  $virtual_address = $boothttp::virtual_address

  file { $config_file:
    ensure  => 'present',
    content => template($template_file)
  }

}
