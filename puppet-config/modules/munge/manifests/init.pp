class munge (
  $service_name      = $munge::params::service_name,
  $service_enable    = $munge::params::service_enable,
  $service_ensure    = $munge::params::service_ensure,
  $service_manage    = $munge::params::service_manage,
  $auth_key_path     = $munge::params::auth_key_path,
  $auth_key_mode     = $munge::params::auth_key_mode,
  $auth_key_name     = $munge::params::auth_key_name,
  $auth_key_source   = $munge::params::auth_key_source,
  $decrypt_passwd    = $munge::params::decrypt_passwd,
  $package_ensure    = $munge::params::package_ensure,
  $package_manage    = $munge::params::package_manage,
  $package_name      = $munge::params::package_name,
) inherits munge::params {


  ### Validate params ###
  validate_string($service_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_numeric($auth_key_mode)
  validate_absolute_path($auth_key_path)
  validate_absolute_path($auth_key_name)
  validate_string($auth_key_source)
  validate_string($auth_key_source)
  validate_string($package_ensure)
  validate_bool($package_manage)
  if $package_manage { validate_array($package_name)}

  anchor { 'munge::begin': } ->
  class { '::munge::install': } ->
  class { '::munge::config': } ->
  class { '::munge::service': } ->
  anchor { 'munge::end': }
}
