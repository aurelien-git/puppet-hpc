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

# Deploys simple stuff.
#
# @param install_manage  Public class manages the installation (default: true)
# @param packages        Array of packages to install (default:
#                        ['simple-package'])
# @param packages_manage Public class installs the packages (default: true)
# @param packages_ensure Target state for the packages (default: 'latest')
# @param services_manage Public class manages the services state (default:
#                        true)
# @param services        Array of services to manage (default:
#                        ['simple-service'])
# @param services_ensure Target state for the services (default: 'running')
# @param services_enable The services start at boot time (default: true)
# @param config_manage   Public class manages the configuration (default: true)

class simple (
  $install_manage   = $::simple::params::install_manage,
  $packages_manage  = $::simple::params::packages_manage,
  $packages         = $::simple::params::packages,
  $packages_ensure  = $::simple::params::packages_ensure,
  $services_manage  = $::simple::params::services_manage,
  $services         = $::simple::params::services,
  $services_ensure  = $::simple::params::services_ensure,
  $services_enable  = $::simple::params::services_enable,
  $config_manage    = $::simple::params::config_manage,
) inherits simple::params {

  validate_bool($packages_manage)
  validate_bool($services_manage)
  validate_bool($config_manage)

  if $install_manage and $packages_manage {
    validate_array($packages)
    validate_string($packages_ensure)
  }

  if $services_manage {
    validate_array($services)
    validate_string($services_ensure)
    validate_bool($services_enable)
  }

  anchor { 'simple::begin': } ->
  class { '::simple::install': } ->
  class { '::simple::config': } ->
  class { '::simple::service': } ->
  anchor { 'simple::end': }

}