require 'erb'
require 'master_manipulator'
require 'dsc_utils'
test_name 'FM-2798 - C68512 - Apply DSC Resource Manifest via "puppet agent"'

# Init
test_dir_name = 'test'
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
test_dir_path = "C:/#{test_dir_name}"
test_file_path = "#{test_dir_path}/test.txt"
test_file_contents = 'catcat'

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_functionality', 'test_file_path.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path)).result(binding)

# Teardown
teardown do
  confine_block(:to, :platform => 'windows') do
    step 'Remove Test Artifacts'
    on(agents, "rm -rf /cygdrive/c/#{test_dir_name}")
  end
end

# Setup
step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => dsc_manifest)
inject_site_pp(master, get_site_pp_path(master), site_pp)

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Run Puppet Agent'
    on(agent, puppet('agent -t --environment production'), :acceptable_exit_codes => [0,2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end

    step 'Verify Results'
    expect_failure('Expected failure due to MODULES-1960 not being implemented yet') do
      assert_dsc_resource(agent, 'File', :DestinationPath => test_file_path, :Contents => test_file_contents)
    end
  end
end
