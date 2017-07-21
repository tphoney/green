# @api private 
# This class handles harddisk power optimizations. Avoid modifying private classes.
class green::disk inherits green {
  if $green::disk_enable {
    if $green::disk_all_disks and !$green::disk_hash.empty {
      fail("Cannot set green::disk_all_disks and green::disk_hash")
    } elsif $green::disk_all_disks {
      notice ("diskall")
      #find all disks
      $disks = $facts['disks']
      $disks.each |$key, $value| {
        notice ( $key )
        $full = "/dev/${key}"
        exec { "${full} timeout ${green::disk_spindown}":
          command => "hdparm -S ${full} ${green::disk_spindown}",
          path    => ['/usr/bin', '/sbin',],
          returns => [0,1,22]
        }
      }
    } else {
      notice ("diskhash")
      $green::disk_hash.each |$key, $value| {
        notice ( $key )
        $full = "/dev/${key}"
        exec { "${full} timeout ${value}":
          command => "hdparm -S ${full} ${value}",
          path    => ['/usr/bin', '/sbin',],
          returns => [0,1,22]
        }
      }
    }
  }
}
