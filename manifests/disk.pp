# @api private 
# This class handles harddisk power optimizations. Avoid modifying private classes.
class green::disk inherits green {
  if $green::disk_enable {
    # if array contains all get actual list of disks, otherwise use provided array
    if $green::disk_all_disks and !$green::disk_hash.empty {
      fail("Cannot set green::disk_enable and green::disk_hash")
    } elsif $green::disk_all_disks {
        #find all disks
        $disks = $facts['disks']
        $disks.each |$key, $value| {
          notice ( $key )
          $full = "/dev/${key}"
          exec { "${key} timeout ${green::disk_spindown}":
            command => "hdparm -S ${full} ${green::disk_spindown}",
            path    => ['/usr/bin', '/sbin',],
            returns => [0,1,22]
          }
        }
      notice ("diskall")
    } else {
      notice ("diskhash")
      #for $merged.each |String $disk, String $timeout| {
      #  exec { "${disk} timeout ${timeout}":
      #    command => "hdparm -S ${disk} ${timeout}",
      #    path    => ['/usr/bin', '/usr/sbin',],
      #    returns => [0,1]
      #  }
      #} 
    }
  }
}
