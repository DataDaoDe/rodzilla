require 'test_helper'

describe Rodzilla::WebService do
  it "products should return ::Resource::Product class" do
    @service = Rodzilla::WebService.new('http://example.io', 'asdf', 'asdf')
    @service.products.must_be_kind_of(Rodzilla::Resource::Product)
  end

  it "bugs should return a Resource::Bug class" do
    @service = Rodzilla::WebService.new('http://example.io', 'asdf', 'asdf')
    @service.bugs.must_be_kind_of(Rodzilla::Resource::Bug)
  end

  it "bugzilla should return a Resource::Bugzilla class" do
    @service = Rodzilla::WebService.new('http://example.io', 'asdf', 'asdf')
    @service.bugzilla.must_be_kind_of(Rodzilla::Resource::Bugzilla)
  end

  it "classifications should return a Resource::Classification class" do
    @service = Rodzilla::WebService.new('http://example.io', 'asdf', 'asdf')
    @service.classifications.must_be_kind_of(Rodzilla::Resource::Classification)
  end

end