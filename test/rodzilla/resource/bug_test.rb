require 'test_helper'

describe Rodzilla::WebService do

  it "should respond_to create" do
    b = Rodzilla::Resource::Bug.new('http://asdf.net', 'asdf', 'asdf', :json)
    b.must_respond_to(:create)
  end

  it "should respond_to create!" do
    b = Rodzilla::Resource::Bug.new('http://asdf.net', 'asdf', 'asdf', :json)
    b.must_respond_to(:create!)
  end

  it "should respond_to fields" do
    b = Rodzilla::Resource::Bug.new('http://asdf.net', 'asdf', 'asdf', :json)
    b.must_respond_to(:fields)
  end

  it "should respond_to search" do
    b = Rodzilla::Resource::Bug.new('http://asdf.net', 'asdf', 'asdf', :json)
    b.must_respond_to(:search)
  end

end