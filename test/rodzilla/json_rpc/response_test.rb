require "test_helper"

describe Rodzilla::JsonRpc::Response do
  
  before do
    def new_response; Rodzilla::JsonRpc::Response.new; end
    @response = Rodzilla::JsonRpc::Response.new
  end

  it "error should always be nil after initialization" do
      new_response.error.must_be_nil
  end

  describe "read_http_response" do
    it "should respond_to read_http_response" do
       @response.must_respond_to(:read_http_response)
    end

    it "should raise an ArgumentError when no args" do
      lambda {
        @response.read_http_response
      }.must_raise(ArgumentError)
    end
  end

  describe "accessors" do
    it "should have method id & id=" do
      @response.must_respond_to(:id)
      @response.must_respond_to(:id=)
    end

    it "should have methods error & error=" do
      @response.must_respond_to(:error)
      @response.must_respond_to(:error=)
    end

    it "should have methods result & result=" do
      @response.must_respond_to(:result)
      @response.must_respond_to(:result=)
    end
  end
end
