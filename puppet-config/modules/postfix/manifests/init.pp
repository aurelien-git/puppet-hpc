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

class postfix ( 
  $pkgs         = $postfix::params::pkgs,
  $pkgs_ensure  = $postfix::params::pkgs_ensure,
  $cfg          = $postfix::params::cfg,
  $cfg_opts     = $postfix::params::cfg_opts
) inherits postfix::params {


  validate_array($pkgs)
  validate_string($pkgs_ensure)
  validate_absolute_path($cfg)
  validate_hash($cfg_opts)

  anchor { 'postfix::begin': } ->
  class { '::postfix::install': } ->
  class { '::postfix::config': } ->
  class { '::postfix::service': } ->
  anchor { 'postfix::end': }
}
