# @summary
#   Allows for the Nginx service to restart when triggered
class nginx::service {
  service { "${nginx::service_name}":
    alias      => 'nginx_service',
    ensure     => $nginx::service_ensure,
    enable     => $nginx::service_enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['nginx::install'],
  }
}
