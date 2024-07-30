# green
#
# Main class, includes all other classes.
#
# @param powertop_enable [Boolean] Whether to use powertop optimizations.
# @param powertop_autotune [Boolean] Whether to use powertop autotune.
# @param powertop_package_ensure [String] Whether to install the Powertop package, and what version to install. 
#        Values: 'present', 'latest', or a specific version number. Default value: 'present'.
# @param powertop_package_manage [Boolean] Whether to manage the Powertop package. Default value: true.
# @param powertop_package_name [Array[String]] Specifies the Powertop package to manage. Default value: ['powertop']
# (except on AIX and Solaris).
# @param powertop_service_enable [Boolean] Whether to enable the Powertop service at boot. Default value: true.
# @param powertop_service_ensure [Enum['running', 'stopped']] Whether the Powertop service should be running. Default value: 'running'.
# @param powertop_service_manage [Boolean] Whether to manage the Powertop service.  Default value: true.
# @param powertop_service_name [String] The Powertop service to manage. Default value: varies by operating system.
# @param powertop_service_provider [String] Which service provider to use for Powertop. Default value: 'undef'.
# @param disk_enable [Boolean] Whether to use hard disk power optimizations. Default value: true.
# @param disk_all_disks [Boolean] Whether to apply the disk spindown setting to all disks. Default value: false.
# @param disk_hash [Hash[String, Integer]] A hash of disk names and spindown times. Default value: {}.
# @param disk_spindown [Integer] The time in seconds before a disk spins down. Default value: 120.
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
  Boolean $disk_enable,
  Boolean $disk_all_disks,
  Hash[String, Integer] $disk_hash,
  Integer $disk_spindown,
) {
  # only if linux
  contain green::powertop
  # windows and linux
  contain green::disk
}
