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

class cce::params {

  $packages_ensure = 'latest'
  $packages        = ['cce-command-suite']
  $config_file     = '/etc/cce/cce.conf'

  $config_options_defaults = {
    'clustername'       => 'cluster',
    'batchname'         => 'slurm',
    'versionbatch'      => '16.05.6',
    #Usernames are upper or lower cased
    'typenni'           => 'tolower',
    'qoshidden'         => 'none',
    'parthidden'        => 'none',
    # Cluster type can be: normal, bluegen. It can't be left empty.
    'typecluster'       => 'normal',
    'enable_cce_mpp'    => 'on',
    'enable_cce_mpinfo' => 'on',
    'enable_cce_mqinfo' => 'on',
    'enable_cce_quota'  => 'off',
    # Define quota def  nomfs:type:typequota:visiblename
    # nomfs       => Name of file system
    # type        => nfs / lustre / gpfs
    # typequota   => uquota ( quota users ) / prjquota ( quota projects ) / volquota ( only nfs quota volume ) / filesetuquota ( gpfs ) / notsetquota
    # visiblename => Name of Volume print
    #listofvolume=""
    # info        => Print information message
    #info=""
    'enable_cce_user'   => 'off',
  }

}
