require 'spec_helper_acceptance'

describe 'green::disk class', :unless => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  it 'cannot have all_disks and hash' do
    pp = <<-EOS
    class { 'green':
      disk_all_disks => true,
      disk_hash => { sda => 60 }
    }
    EOS
    expect(apply_manifest(pp, :expect_failures => true).stderr).to match(/Cannot set green::disk_all_disks and green::disk_hash/i)
  end
  it 'iterates over hash' do
    pp = <<-EOS
    class { 'green':
      disk_all_disks => false,
      disk_hash => { sda => 60 }
    }
    EOS
    apply_manifest(pp, :catch_failures => true)
  end


end
