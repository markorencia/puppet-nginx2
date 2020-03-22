# @summary
#   Generates virtual hosts files based on template
#
# @example
#   nginx::vhosts { 'namevar': }
#    port      => INT,
#    subdomain => STR,
#    admin     => STR,
#    docroot   => STR,
define nginx::vhosts (
  Integer   $port,
  String    $httpsport,
  String[1] $subdomain,
  String[1] $docroot,
  String    $ssl_certificate,
  String    $ssl_certificate_key,
  String    $ssl_dhparam,
  String    $php,
) {
  file { "${docroot}":
    ensure => 'directory',
    owner  => $nginx::vhosts_owner,
    group  => $nginx::vhosts_group,
  }
  
  file { "${nginx::vhosts_dir}/${subdomain}.conf":
    ensure  => 'file',
    owner   => $nginx::vhosts_owner,
    group   => $nginx::vhosts_group,
    mode    => '0644',
    content => epp('nginx/vhosts.conf.epp', {'port' => $port, 'subdomain' => $subdomain, 'httpsport' => $httpsport, 'docroot' => $docroot, 'ssl_certificate' => $ssl_certificate, 'ssl_certificate_key' => $ssl_certificate_key, 'ssl_dhparam' => $ssl_dhparam, 'php' => $php}),
    notify  => Service["${nginx::service_name}"],
  }
}
