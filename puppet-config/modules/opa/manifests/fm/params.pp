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

class opa::fm::params {
  #### Module variables
  $packages        = ['opa-fm']
  $packages_ensure = installed
  $service         = 'opafm'
  $service_ensure  = running
  $service_enable  = true

  $config_file     = '/etc/opa/opafm.xml'
  $config_source   = undef

  $fe_enable       = true
  $fe_sslsecurity  = false
  $devicegroups    = {}
  $pmportgroups    = {}

}