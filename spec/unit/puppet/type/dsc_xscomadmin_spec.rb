#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscomadmin) do

  let :dsc_xscomadmin do
    Puppet::Type.type(:dsc_xscomadmin).new(
      :name     => 'foo',
      :dsc_principal => 'foo',
      :dsc_userrole => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscomadmin.to_s).to eq("Dsc_xscomadmin[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscomadmin[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscomadmin[:dsc_ensure] = 'Present'
    expect(dsc_xscomadmin[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscomadmin[:dsc_ensure] = 'present'
    expect(dsc_xscomadmin[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscomadmin[:dsc_ensure] = 'present'
    expect(dsc_xscomadmin[:ensure]).to eq(dsc_xscomadmin[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscomadmin[:dsc_ensure] = 'Absent'
    expect(dsc_xscomadmin[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscomadmin[:dsc_ensure] = 'absent'
    expect(dsc_xscomadmin[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscomadmin[:dsc_ensure] = 'absent'
    expect(dsc_xscomadmin[:ensure]).to eq(dsc_xscomadmin[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscomadmin[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscomadmin[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscomadmin[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscomadmin[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscomadmin[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_principal is specified' do
    #dsc_xscomadmin[:dsc_principal]
    expect { Puppet::Type.type(:dsc_xscomadmin).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_userrole => 'foo',
      :dsc_scomadmincredential => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_principal is a required attribute/)
  end

  it 'should not accept array for dsc_principal' do
    expect{dsc_xscomadmin[:dsc_principal] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_principal' do
    expect{dsc_xscomadmin[:dsc_principal] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_principal' do
    expect{dsc_xscomadmin[:dsc_principal] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_principal' do
    expect{dsc_xscomadmin[:dsc_principal] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_userrole is specified' do
    #dsc_xscomadmin[:dsc_userrole]
    expect { Puppet::Type.type(:dsc_xscomadmin).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_principal => 'foo',
      :dsc_scomadmincredential => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_userrole is a required attribute/)
  end

  it 'should not accept array for dsc_userrole' do
    expect{dsc_xscomadmin[:dsc_userrole] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_userrole' do
    expect{dsc_xscomadmin[:dsc_userrole] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_userrole' do
    expect{dsc_xscomadmin[:dsc_userrole] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_userrole' do
    expect{dsc_xscomadmin[:dsc_userrole] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scomadmincredential' do
    expect{dsc_xscomadmin[:dsc_scomadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scomadmincredential' do
    expect{dsc_xscomadmin[:dsc_scomadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scomadmincredential' do
    expect{dsc_xscomadmin[:dsc_scomadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scomadmincredential' do
    expect{dsc_xscomadmin[:dsc_scomadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscomadmin)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscomadmin)
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

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xscomadmin.original_parameters[:dsc_ensure] = 'present'
        dsc_xscomadmin[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscomadmin)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscomadmin[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xscomadmin.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscomadmin[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscomadmin)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscomadmin[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
