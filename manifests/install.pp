# @summary 
#   Install the base Nginx package
#
# @example
#   include nginx::install
class nginx::install {
  package { "${nginx::install_name}":
    ensure => $nginx::install_ensure,
  }
}
