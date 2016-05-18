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

class clara (
  $packages         = $::clara::params::packages,
  $packages_ensure  = $::clara::params::packages_ensure,
  $config_file      = $::clara::params::config_file,
  $repos_file       = $::clara::params::repos_file,
  $repos_options    = $::clara::params::repos_options,
  $keyring_file     = $::clara::params::keyring_file,
  $keyring_source   = $::clara::params::keyring_source,
  $password_file    = $::clara::params::password_file,
  $password_options = {},
  $common_options   = {},
  $repo_options     = {},
  $ipmi_options     = {},
  $images_options   = {},
  $p2p_options      = {},
  $build_options    = {},
  $slurm_options    = {},
  $config_options   = {},
) inherits clara::params {
  validate_array($packages)
  validate_string($packages_ensure)
  validate_absolute_path($config_file)
  validate_absolute_path($repos_file)
  validate_absolute_path($repos_file)
  validate_absolute_path($keyring_file)
  validate_string($keyring_source)
  validate_absolute_path($password_file)
  validate_hash($password_options)
  validate_hash($repos_options)
  validate_hash($common_options)
  validate_hash($repo_options)
  validate_hash($ipmi_options)
  validate_hash($images_options)
  validate_hash($p2p_options)
  validate_hash($build_options)
  validate_hash($slurm_options)

  $_common_options = deep_merge($common_options_default, $common_options) 
  $_repo_options   = deep_merge($repo_options_default,   $repo_options) 
  $_ipmi_options   = deep_merge($ipmi_options_default,   $ipmi_options) 
  $_images_options = deep_merge($images_options_default, $images_options) 
  $_p2p_options    = deep_merge($p2p_options_default,    $p2p_options) 
  $_build_options  = deep_merge($build_options_default,  $build_options) 
  $_slurm_options  = deep_merge($slurm_options_default,  $slurm_options) 

  $generic_config_options = {
    'common' => $::clara::_common_options,
    'repo'   => $::clara::_repo_options,
    'ipmi'   => $::clara::_ipmi_options,
    'images' => $::clara::_images_options,
    'p2p'    => $::clara::_p2p_options,
    'build'  => $::clara::_build_options,
    'slurm'  => $::clara::_slurm_options,
  }

  $_config_options = merge($generic_config_options, $config_options)

  $_password_options = merge($password_options_default, $password_options)

  anchor { 'clara::begin': } ->
  class { '::clara::install': } ->
  class { '::clara::config': } ->
  anchor { 'clara::end': }

}
