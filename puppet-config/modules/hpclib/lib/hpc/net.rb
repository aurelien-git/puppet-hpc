#!/usr/bin/env ruby
##########################################################################
#  Puppet configuration file                                             #
#                                                                        #
#  Copyright (C) 2016-2017 EDF S.A.                                      #
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

require 'hpc/dns' # get_network_topology()

# @return CIDR of the network
# @param net_name Name the network
def hpc_net_cidr(net_name)

  net_topology = get_network_topology()
  if not net_topology.has_key?(net_name)
    STDERR.puts "Unable to determine CIDR of unknown #{net_name} network"
    return nil
  end

  return net_topology[net_name]['ipnetwork'] +
         net_topology[net_name]['prefix_length']
end

# @return Array of IP addresses
# @param net_names filter the IP addresses on these network, if nil return
#          IP of the network.
def hpc_net_ip_addrs(net_names = nil)
  # Retrieve facts
  mymasternet = lookupvar('::mymasternet')

  result = Array.new()

  mymasternet['networks'].each do |net_name, options|
    if net_names == nil or net_names.include?(net_name)
      if options.has_key?('IP')
        result.push(options['IP'])
      end
    end
  end

  return result
end
