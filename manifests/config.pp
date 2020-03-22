# @summary
#   Manages any Nginx Configuration 
class nginx::config {
  file { 'nginx_config':
    ensure => $nginx::config_ensure,
    path   => $nginx::config_path,
    source => "puppet:///modules/nginx/${osfamily}.conf",
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
}
