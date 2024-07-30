# @api private 
# This class handles powertop. Avoid modifying private classes.
class green::powertop inherits green {
  if $green::powertop_enable {
    if $green::powertop_package_manage {
      package { $green::powertop_package_name:
        ensure => $green::powertop_package_ensure,
      }
    }

    if $green::powertop_autotune {
      exec { 'powertop_autotune':
        command => 'powertop --auto-tune',
        path    => ['/usr/bin', '/usr/sbin',],
        returns => [0,1],
      }
    }
  }
}
