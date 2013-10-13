require "test_helper"


describe Rodzilla::Resource::Base do
  before do
    @base = Rodzilla::Resource::Base.new('http://example.io', 'uname', 'passwd')
  end

  describe "instance" do

    it { @base.must_respond_to('base_url') }
    it { @base.must_respond_to('base_url=') }

    it { @base.must_respond_to('username') }
    it { @base.must_respond_to('username=') }
    
    it { @base.must_respond_to('password') }
    it { @base.must_respond_to('password=') }

    it { @base.must_respond_to('format') }
    it { @base.must_respond_to('format=') }

    it { @base.must_respond_to('request_url') }
    it { @base.must_respond_to('request_url=') }

    it { @base.must_respond_to('response') }
    it { @base.must_respond_to('response=') }

    it { @base.must_respond_to('result') }
    it { @base.must_respond_to('result=') }

    it { @base.must_respond_to('credentials') }
    it { @base.must_respond_to('credentials=') }

    describe "class methods" do
      it { Rodzilla::Resource::Base.must_respond_to(:demodulize) }
    end

    describe "protected_methods" do
      it { @base.protected_methods.must_include(:prepare_request) }
      it { @base.protected_methods.must_include(:build_url) }
      it { @base.protected_methods.must_include(:build_params) }
      it { @base.protected_methods.must_include(:make_id) }
      it { @base.protected_methods.must_include(:rpc_call) }
      it { @base.protected_methods.must_include(:parse_rpc_response!) }
    end

  end
end