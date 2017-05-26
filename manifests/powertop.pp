# @api private 
# This class handles powertop. Avoid modifying private classes.
class green::powertop inherits green {
  if $green::powertop_enable {
    if $green::powertop_package_manage {
      package { $green::powertop_package_name:
        ensure => $green::powertop_package_ensure,
      }
    }

    if $green::powertop_service_manage == true {
      service { 'green':
        ensure     => $green::powertop_service_ensure,
        enable     => $green::powertop_service_enable,
        name       => $green::powertop_service_name,
        provider   => $green::powertop_service_provider,
        hasstatus  => true,
        hasrestart => true,
      }
    }
  }
}
