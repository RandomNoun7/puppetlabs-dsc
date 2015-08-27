#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurepackidentityprovider) do

  let :dsc_xazurepackidentityprovider do
    Puppet::Type.type(:dsc_xazurepackidentityprovider).new(
      :name     => 'foo',
      :dsc_target => 'Membership',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurepackidentityprovider.to_s).to eq("Dsc_xazurepackidentityprovider[foo]")
  end

  it 'should require that dsc_target is specified' do
    #dsc_xazurepackidentityprovider[:dsc_target]
    expect { Puppet::Type.type(:dsc_xazurepackidentityprovider).new(
      :name     => 'foo',
      :dsc_fullyqualifieddomainname => 'foo',
      :dsc_port => 16,
      :dsc_azurepackadmincredential => 'foo',
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_target is a required attribute/)
  end

  it 'should accept dsc_target predefined value Membership' do
    dsc_xazurepackidentityprovider[:dsc_target] = 'Membership'
    expect(dsc_xazurepackidentityprovider[:dsc_target]).to eq('Membership')
  end

  it 'should accept dsc_target predefined value membership' do
    dsc_xazurepackidentityprovider[:dsc_target] = 'membership'
    expect(dsc_xazurepackidentityprovider[:dsc_target]).to eq('membership')
  end

  it 'should accept dsc_target predefined value Windows' do
    dsc_xazurepackidentityprovider[:dsc_target] = 'Windows'
    expect(dsc_xazurepackidentityprovider[:dsc_target]).to eq('Windows')
  end

  it 'should accept dsc_target predefined value windows' do
    dsc_xazurepackidentityprovider[:dsc_target] = 'windows'
    expect(dsc_xazurepackidentityprovider[:dsc_target]).to eq('windows')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackidentityprovider[:dsc_target] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_target' do
    expect{dsc_xazurepackidentityprovider[:dsc_target] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_target' do
    expect{dsc_xazurepackidentityprovider[:dsc_target] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_target' do
    expect{dsc_xazurepackidentityprovider[:dsc_target] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_target' do
    expect{dsc_xazurepackidentityprovider[:dsc_target] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackidentityprovider[:dsc_fullyqualifieddomainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackidentityprovider[:dsc_fullyqualifieddomainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackidentityprovider[:dsc_fullyqualifieddomainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackidentityprovider[:dsc_fullyqualifieddomainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_xazurepackidentityprovider[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_xazurepackidentityprovider[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_port' do
    expect{dsc_xazurepackidentityprovider[:dsc_port] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_port' do
    dsc_xazurepackidentityprovider[:dsc_port] = 16
    expect(dsc_xazurepackidentityprovider[:dsc_port]).to eq(16)
  end


  it 'should accept string-like int for dsc_port' do
    dsc_xazurepackidentityprovider[:dsc_port] = '16'
    expect(dsc_xazurepackidentityprovider[:dsc_port]).to eq(16)
  end


  it 'should accept string-like int for dsc_port' do
    dsc_xazurepackidentityprovider[:dsc_port] = '32'
    expect(dsc_xazurepackidentityprovider[:dsc_port]).to eq(32)
  end


  it 'should accept string-like int for dsc_port' do
    dsc_xazurepackidentityprovider[:dsc_port] = '64'
    expect(dsc_xazurepackidentityprovider[:dsc_port]).to eq(64)
  end

  it 'should not accept array for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackidentityprovider[:dsc_azurepackadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackidentityprovider[:dsc_azurepackadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackidentityprovider[:dsc_azurepackadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackidentityprovider[:dsc_azurepackadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xazurepackidentityprovider[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xazurepackidentityprovider[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xazurepackidentityprovider[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xazurepackidentityprovider[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstance' do
    expect{dsc_xazurepackidentityprovider[:dsc_sqlinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstance' do
    expect{dsc_xazurepackidentityprovider[:dsc_sqlinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstance' do
    expect{dsc_xazurepackidentityprovider[:dsc_sqlinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstance' do
    expect{dsc_xazurepackidentityprovider[:dsc_sqlinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurepackidentityprovider)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurepackidentityprovider)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

  end
end
