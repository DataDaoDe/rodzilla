require "test_helper"


describe Rodzilla::Resource::Base do
  before do
    @base = Rodzilla::Resource::Base.new('http://example.io', 'uname', 'passwd')
  end
  describe "instance" do
    it { @base.must_respond_to('base_url') }
  end
end