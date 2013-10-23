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

  it "must set Bugzilla_login and Bugzilla_password on initialize" do
    s = new_service
    s.internal_variable_get(:@credentials).wont_be_nil
    s.credentials.must_equal({ Bugzilla_login: "user", Bugzilla_password: "passwd" })
  end

  describe "post request should raise a ResponseError if error is not nil" do
    s = new_service
    lambda { s.post_request }.must_raise(Rodzilla::JsonRpc::Error::ResponseError)
  end

  describe "post_request should return the Response#result" do
    s = new_service
    s.post_request.must_be_kind_of(Rodzilla::JsonRpc::Response)
  end

  describe "cycle_id checks" do
    
    it "generate_cycle_id should return 1" do
      @service.send(:generate_cycle_id).must_equal(1)
    end

    it "check_cycle_id should return false if request.id is not equal to response.id" do
      s = new_service
      s.send(:setup_request)
      s.rpc_request.id = 5
      s.rpc_response = Rodzilla::JsonRpc::Response.new
      s.rpc_response.id = 4
      s.send(:check_cycle_id).must_equal(false)
    end

    it "check_cycle_id should return true if request.id and response.id are equal" do
      s = new_service
      s.send(:setup_request)
      s.rpc_request.id = 3
      s.rpc_response = Rodzilla::JsonRpc::Response.new
      s.rpc_response.id = 3
      s.send(:check_cycle_id).must_equal(true)
    end
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
