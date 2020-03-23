# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include nginx::generate_vhost
class nginx::generate_vhost {
  nginx::vhosts { 'quickstart3':
    port                => 80,
    subdomain           => 'quickstart3',
    httpsport           => '',
    docroot             => '/usr/share/nginx/quickstart3',
    ssl_certificate     => '',
    ssl_certificate_key => '',
    ssl_dhparam         => '',
    php                 => '',

  }  
}
