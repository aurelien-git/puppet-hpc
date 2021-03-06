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

# Masquerading (NAT) rules
#
# @param interface Name of the output network interface
# @param source Source zone and network address of the masqueraded traffic
# @param dest Destination zone and network address of the masqueraded
#          traffic
# @param comment String added to config file above the rule
define shorewall::masq (
  $interface,
  $source,
  $dest      = '',
  $comment   = '',
) {

  concat::fragment { "shorewall_masqs_masq_${name}":
    target  => $::shorewall::masq_file,
    order   => '11',
    content => "#${name}: ${comment}\n${interface}:${dest} ${source}\n"
  }

}

