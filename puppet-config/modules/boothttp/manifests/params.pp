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
class boothttp::params {

  $config_dir        = '/public/'
  $config_dir_source = '/path/to/sources'

  # Files and directories that can be downloaded by HTTP
  $config_dir_http = "${config_dir}/http"
  $menu_source     = "${config_dir_source}/bootmenu.rb"

  $hpc_files = {}
  $archives  = {}

  $install_options = {}

  $supported_os = {
    'calibre9' => {
      'os' => 'calibre9',
    }
  }

}