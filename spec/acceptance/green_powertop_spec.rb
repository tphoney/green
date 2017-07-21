require 'spec_helper_acceptance'

powertop_packagename = 'powertop'

describe 'green::powertop class', :unless => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  it 'installs the package' do
    apply_manifest(%{
      class { 'green': }
    }, :catch_failures => true)
  end

  Array(powertop_packagename).each do |package|
    describe package(package) do
      it { should be_installed }
    end
  end
end
