require 'test_helper'

describe Rodzilla::JsonRpc::Error do

  describe "Exceptions" do
    it "it should have a InvalidResponseId" do
      Rodzilla::JsonRpc::Error.constants.must_include(:InvalidResponseId)
    end

    it "it should have a UnsupportedHttpMethod" do
      Rodzilla::JsonRpc::Error.constants.must_include(:UnsupportedHttpMethod)
    end

    it "it should have a ResponseError" do
      Rodzilla::JsonRpc::Error.constants.must_include(:ResponseError)
    end

    it "it should have a ClientError which inherits from ResponseError" do
      Rodzilla::JsonRpc::Error.constants.must_include(:ClientError)
      Rodzilla::JsonRpc::Error::ClientError.superclass.must_equal(Rodzilla::JsonRpc::Error::ResponseError)
    end

    it "it should have a ServerError which inherits from ResponseError" do
      Rodzilla::JsonRpc::Error.constants.must_include(:ServerError)
      Rodzilla::JsonRpc::Error::ServerError.superclass.must_equal(Rodzilla::JsonRpc::Error::ResponseError)
    end

    it "it should have a HttpError" do
      Rodzilla::JsonRpc::Error.constants.must_include(:HttpError)
    end

  end

end