# @summary
#   Installs, configures, and setup Nginx
#
# @example
#   include apache
class nginx (
  String $install_name,
  String $install_ensure,
  String $config_ensure,
  String $config_path,
  Enum["running", "stopped"] $service_ensure,
  String $service_name,
  Boolean $service_enable,
  String[1] $vhosts_dir,
  String[1] $vhosts_owner,
  String[1] $vhosts_group,
) {
  contain nginx::install
  contain nginx::config
  contain nginx::service

  Class['::nginx::install']
  -> Class['::nginx::config']
  ~> Class['::nginx::service']
}
