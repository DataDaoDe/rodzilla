require 'test_helper'

describe Rodzilla::WebService do

  before do
    @service = Rodzilla::WebService.new('http://example.io', 'asdf', 'asdf')
  end

  describe "Constructor" do
    it "should accept 4 parameters: base_url, username, password, and format" do
      s = Rodzilla::WebService.new('http://example.io', 'uname', 'passwd', :json)
      s.instance_variable_get(:@username).must_equal('uname')
      s.instance_variable_get(:@password).must_equal('passwd')
      s.base_url.must_equal('http://example.io')
      s.format.must_equal(:json)
    end

    it "should raise an ArgumentError if base_url, username, and password are not given" do
      Proc.new do
        Rodzilla::WebService.new('http://example.io', 'uname')
      end.must_raise(ArgumentError)
    end

    it "should by default set the format to json" do
      s = Rodzilla::WebService.new('http://example.io', 'uname', 'passwd')
      s.format.must_equal(:json)
    end
  end

  describe "Attributes" do

    it "should have attr_accessor for base_url" do
      @service.must_respond_to(:base_url)
      @service.must_respond_to(:base_url=)
    end
    
    it "should have attr_accessor for format" do
      @service.must_respond_to(:format)
      @service.must_respond_to(:format=)
    end

    it "should have attr_accessor for resource" do
      @service.must_respond_to(:resource)
      @service.must_respond_to(:resource=)
    end

  end

  describe "Resources" do

    it "bugs should return a Resource::Bug class" do
      @service.bugs.must_be_kind_of(Rodzilla::Resource::Bug)
    end

    it "bugzilla should return a Resource::Bugzilla class" do
      @service.bugzilla.must_be_kind_of(Rodzilla::Resource::Bugzilla)
    end

    it "classifications should return a Resource::Classification class" do
      @service.classifications.must_be_kind_of(Rodzilla::Resource::Classification)
    end

    it "groups should return a Resource::Group class" do
      @service.groups.must_be_kind_of(Rodzilla::Resource::Group)
    end

    it "products should return ::Resource::Product class" do
      @service.products.must_be_kind_of(Rodzilla::Resource::Product)
    end

    it "users should return ::Resource::User class" do
      @service.users.must_be_kind_of(Rodzilla::Resource::User)
    end

    it "bugzilla_resource should raise a Rodzilla::ResourceNotFoundError exception for undefined resources" do
      Proc.new do
        @service.send(:bugzilla_resource, "Nada")
      end.must_raise(Rodzilla::Error::ResourceNotFoundError)
    end

  end

end
