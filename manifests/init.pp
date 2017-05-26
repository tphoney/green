# green
#
# Main class, includes all other classes.
#
# @param powertop_enable [Boolean] Whether to use powertop optimizations. 
# @param package_ensure [String] Whether to install the Powertop package, and what version to install. Values: 'present', 'latest', or a specific version number. Default value: 'present'.
# @param package_manage [Boolean] Whether to manage the Powertop package. Default value: true.
# @param package_name [Array[String]] Specifies the Powertop package to manage. Default value: ['powertop'] (except on AIX and Solaris).
# @param service_enable [Boolean] Whether to enable the Powertop service at boot. Default value: true.
# @param service_ensure [Enum['running', 'stopped']] Whether the Powertop service should be running. Default value: 'running'.
# @param service_manage [Boolean] Whether to manage the Powertop service.  Default value: true.
# @param service_name [String] The Powertop service to manage. Default value: varies by operating system.
# @param service_provider [String] Which service provider to use for Powertop. Default value: 'undef'.
class green (
  Boolean $powertop_enable,
  Boolean $powertop_autotune,
  String $powertop_package_ensure,
  Boolean $powertop_package_manage,
  Array[String] $powertop_package_name,
  Boolean $powertop_service_enable,
  Enum['running', 'stopped'] $powertop_service_ensure,
  Boolean $powertop_service_manage,
  String $powertop_service_name,
  Optional[String] $powertop_service_provider,
) {

  contain green::powertop

}
