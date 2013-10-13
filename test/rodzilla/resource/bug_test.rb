require 'test_helper'

describe Rodzilla::Resource::Bug do
  before do
    @bug = Rodzilla::Resource::Bug.new('http://asdf.net', 'asdf', 'asdf', :json)
  end

  describe "bug instance" do
    it "should inherit from Rodzilla::Resource::Base" do
      @bug.class.superclass.must_equal(Rodzilla::Resource::Base)
    end

    it "should respond_to create" do
      @bug.must_respond_to(:create)
    end

    it "should respond_to create!" do
      @bug.must_respond_to(:create!)
    end

    it "should respond_to fields" do
      @bug.must_respond_to(:fields)
    end

    it "should respond_to search" do
      @bug.must_respond_to(:search)
    end

  end

  describe "validations" do

    it "should have all Bugzilla REQUIRED_FIELDS for bug creation" do
      Rodzilla::Resource::Bug.constants.must_include(:REQUIRED_FIELDS)
      [:product, :component, :summary,
        :version, :description, :op_sys,
        :platform, :priority, :severity].each do |field|
          Rodzilla::Resource::Bug::REQUIRED_FIELDS.must_include(field)
      end
    end

  end

end
