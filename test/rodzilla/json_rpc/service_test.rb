require 'test_helper'

describe Rodzilla::JsonRpc::Service do
  before do
    def new_service; Rodzilla::JsonRpc::Service.new('http://bugzilla.test.com/jsonrpc.cgi', 'user', 'passwd'); end
    @service = Rodzilla::JsonRpc::Service.new('http://bugzilla.test.com/jsonrpc.cgi', 'user', 'passwd')
    stub_bugzilla_request('Bugzilla.version')
    @version_body = method_fixture('Bugzilla_version.json').read
  end

  it "must include HTTParty" do
    @service.class.ancestors.must_include(HTTParty)
  end

  it "generate_cycle_id should return 1" do
    @service.send(:generate_cycle_id).must_equal(1)
  end


  describe "send_request!" do
    it "should raise an ArgumentError when no rpc_method is supplied" do
      lambda { @service.send_request! }.must_raise(ArgumentError)
    end

    it "should raise a UnsupportedHttpMethod error when a http_method besides GET or POST is used" do
      lambda {
        @service.send_request!('Bugzilla.version', {}, :put)
      }.must_raise(Rodzilla::JsonRpc::Error::UnsupportedHttpMethod)
    end

    it "should return a JSON Hash for a successfull API call" do
      @service.send_request!('Bugzilla.version').must_be_kind_of(Hash)
    end
  end

  describe "setup request" do

    it "should instantiate the request object" do
      s = new_service
      s.rpc_request = nil
      s.send(:setup_request)
      s.rpc_request.must_be_kind_of(Rodzilla::JsonRpc::Request)
    end

    it "should set the json-rpc header on request.headers object" do
      s = new_service
      s.rpc_request = nil
      s.send(:setup_request)
      s.rpc_request.headers.must_equal({ 'Content-Type' => 'application/json-rpc' })
    end

  end

  describe "setup_request_data" do

    it "should raise an ArgumentError when no rcp_method is supplied" do
      lambda { @service.send(:setup_request_data) }.must_raise(ArgumentError)
    end

    it "should always include the credentials in the params" do
      new_method = 'Bugzilla.version'
      new_params = { ids: [1,2,3] }

      orig_creds = @service.credentials.dup

      @service.send(:setup_request_data, new_method, new_params )

      
      @service.rpc_request.method.must_equal(new_method)

      @service.rpc_request.params[:Bugzilla_login].wont_be_nil
      @service.rpc_request.params[:Bugzilla_password].wont_be_nil
    end
  end

end