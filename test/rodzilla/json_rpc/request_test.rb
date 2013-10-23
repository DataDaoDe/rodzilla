require "test_helper"

describe Rodzilla::JsonRpc::Request do
  before do
    @request = Rodzilla::JsonRpc::Request.new
    def new_breq(&block); Rodzilla::JsonRpc::Request.new(&block); end
  end

  it "should yield itself if a block is given on initialize" do
      r = new_breq { |req| req.id = 15 }
      r.id.must_equal(15)
  end

  it "should have a method get_request_object" do
      @request.must_respond_to(:get_request_object)
  end

  it "get_request_object should return a hash with id, method, and params" do
    r = new_breq { |req| req.id = 5; req.method = "Test.remote" }
    r.get_request_object.must_equal({ id: 5, method: "Test.remote", params: nil }
  end

  it "serialize should a valid JSON String" do
    r = new_breq { |req| req.id = 5; req.method = "Hello" }
    r.serialize.must_be_kind_of(String)
  end

  describe "attributes" do
    it "should have methods 'method' and 'method='" do
      @request.must_respond_to(:method)
      @request.must_respond_to(:method=)
    end

    it "should have methods params and params=" do
      @request.must_respond_to(:params)
      @request.must_respond_to(:params=)
    end

    it "should have methods id and id=" do
      @request.must_respond_to(:id)
      @request.must_respond_to(:id=)
    end

    it "should have methods headers and headers=" do
      @request.must_respond_to(:headers)
      @request.must_respond_to(:headers=)
    end

  end

end
