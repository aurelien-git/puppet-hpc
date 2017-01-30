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

class cpufreq::params {

#### Module variables

  $packages_ensure = 'latest'
  $packages        = ['cpufrequtils']
  $default_file    = '/etc/default/cpufrequtils'
  $service         = 'cpufrequtils'
  $service_ensure  = running
  $service_enable  = true

#### Defaults values
  $default_options = {
    'ENABLE'    => '"true"',
    'GOVERNOR'  => '"performance"',
    'MAX_SPEED' => '"0"',
    'MIN_SPEED' => '"0"',
  }

}
