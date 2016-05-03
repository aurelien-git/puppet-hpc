class mariadb (
  $config_manage        = $mariadb::params::config_manage,
  $mariadb_preseed_file = $mariadb::params::mariadb_preseed_file,
  $mariadb_preseed_tmpl = $mariadb::params::mariadb_preseed_tmpl,
  $main_conf_file       = $mariadb::params::main_conf_file,
  $galera_conf_file     = $mariadb::params::galera_conf_file,
  $mysql_conf_options   = $mariadb::params::mysql_conf_options,
  $galera_conf_options  = $mariadb::params::galera_conf_options,
  $package_manage       = $mariadb::params::package_manage,
  $package_ensure       = $mariadb::params::package_ensure,
  $package_name         = $mariadb::params::package_name,
  $service_manage       = $mariadb::params::service_manage,
  $service_ensure       = $mariadb::params::service_ensure,
  $service_enable       = $mariadb::params::service_enable,
  $service_name         = $mariadb::params::service_name,
  $mysql_root_pwd, 
) inherits mariadb::params {



  ### Validate params ###
  validate_bool($package_manage)
  validate_bool($config_manage)
  validate_bool($service_manage)
  validate_string($mysql_root_pwd)

  if $package_manage {
    validate_array($package_name)
    validate_string($package_ensure)
  }

  if $config_manage {
    validate_absolute_path($mariadb_preseed_file) 
    validate_string($mariadb_preseed_tmpl) 
    validate_absolute_path($main_conf_file)      
    validate_absolute_path($galera_conf_file)   
    validate_string($galera_conf_tmpl)  
    validate_hash($mysql_conf_options)  
    validate_hash($galera_conf_options)
  }

  if $service_manage {
    validate_bool($service_enable)
    validate_string($service_name)
    validate_string($service_ensure)
  }

  anchor { 'mariadb::begin': } ->
  class { '::mariadb::install': } ->
  class { '::mariadb::config': } ->
  class { '::mariadb::service': } ->
  anchor { 'mariadb::end': }
}
