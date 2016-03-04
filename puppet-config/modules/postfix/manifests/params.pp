##########################################################################
#  Puppet configuration file                                             #
#                                                                        #
#  Copyright (C) 2014-2015 EDF S.A.                                      #
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

class postfix::params {


#### Module variables

  $pkgs       = ['postfix']
  $serv       = 'postfix'
  $cfg        = '/etc/postfix/main.cf'

#### Default values

  $cfg_opts   = {
    'myhostname'                          => $hostname,
    'queue_directory'                     => '/var/spool/postfix',
    'command_directory'                   => '/usr/sbin',
    'data_directory'                      => '/var/lib/postfix',
    'mail_owner'                          => 'postfix',
    'inet_protocols'                      => 'all',
    'unknown_local_recipient_reject_code' => '550',
    'alias_maps'                          => 'hash:/etc/aliases',
    'alias_database'                      => 'hash:/etc/aliases',
    'debug_peer_level'                    => '2',
    'sendmail_path'                       => '/usr/sbin/sendmail.postfix',
    'newaliases_path'                     => '/usr/bin/newaliases.postfix',
    'mailq_path'                          => '/usr/bin/mailq.postfix',
    'setgid_group'                        => 'postdrop',
    'html_directory'                      => 'no',
    'readme_directory'                    => 'no',
    'mydomain'                            => "${cluster}.${domain}",
    'myorigin'                            => '$mydomain',
    'mailbox_size_limit'                  => '0',
    'smtpd_use_tls'                       => 'no',
    'recipient_delimiter'                 => '+',
    'biff'                                => 'no',
    'inet_protocols'                      => 'ipv4',
    'smtpd_recipient_restrictions'        => 'permit_mynetworks permit_sasl_authenticated check_relay_domains defer_unauth_destination',
    'smtpd_banner'                        => '$myhostname ESMTP $mail_name (Debian/GNU)',
    'append_dot_mydomain'                 => 'yes',
    'smtp_host_lookup'                    => 'dns,native',
    'inet_interfaces'                     => 'all',
    'mydestination'                       => '$mydomain, $myhostname, localhost.$mydomain, localhost',
    'relay_domains'                       => '$mydestination edf.fr',
    'relayhost'                           => '',
  }
}
