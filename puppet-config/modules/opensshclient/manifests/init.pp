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

class opensshclient (
  $packages            = $opensshclient::params::packages,
  $packages_ensure     = $opensshclient::params::packages_ensure,
  $main_config         = $opensshclient::params::main_config,
  $main_config_options = $opensshclient::params::main_config_options,
  $augeas_context      = $opensshclient::params::augeas_context,
  $cluster             = '',
  $public_key          = '',
) inherits opensshclient::params {

  validate_array($packages)
  validate_string($packages_ensure)
  validate_absolute_path($main_config)
  validate_array($main_config_options)
  validate_absolute_path($augeas_context)
  validate_string($public_key)

  anchor { 'opensshclient::begin': } ->
  class { '::opensshclient::install': } ->
  class { '::opensshclient::config': } ->
  class { '::opensshclient::keys': } ->
  anchor { 'opensshclient::end': }

}
