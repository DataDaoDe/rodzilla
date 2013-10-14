require "test_helper"


describe Rodzilla::Resource::Base do
  before do
    @base = Rodzilla::Resource::Base.new('http://example.io', 'uname', 'passwd')
  end

  describe "instance" do

    it "has base_url accessors" do 
      @base.must_respond_to('base_url')
      @base.must_respond_to('base_url=')
    end

    it "has username accessors" do 
      @base.must_respond_to('username')
      @base.must_respond_to('username=')
    end

    it "has password accessors" do 
      @base.must_respond_to('password')
      @base.must_respond_to('password=')
    end

    it "has format accessors" do 
      @base.must_respond_to('format')
      @base.must_respond_to('format=')
    end

    it "has request_url accessors" do 
      @base.must_respond_to('request_url')
      @base.must_respond_to('request_url=')
    end

    it "has response accessors" do 
      @base.must_respond_to('response')
      @base.must_respond_to('response=')
    end

    it "has result accessors" do 
      @base.must_respond_to('result')
      @base.must_respond_to('result=')
    end

    it "has credentials accessors" do 
      @base.must_respond_to('credentials')
      @base.must_respond_to('credentials=')
    end

    it "has headers accessors" do 
      @base.must_respond_to('headers')
      @base.must_respond_to('headers=')
    end

    describe "class methods" do
      it "has a demodularize method" do 
        Rodzilla::Resource::Base.must_respond_to(:demodulize)
      end
    end

    describe "protected_methods" do
      it "has a prepare_request method" do
        @base.protected_methods.must_include(:prepare_request)
      end
      it "has a build_url method" do
        @base.protected_methods.must_include(:build_url)
      end
      it "has a build_params method" do
        @base.protected_methods.must_include(:build_params)
      end
      it "has a make_id method" do
        @base.protected_methods.must_include(:make_id)
      end

      it "has a rpc_call method" do
        @base.protected_methods.must_include(:rpc_call)
      end

      it "has a parse_rpc_response! method" do
        @base.protected_methods.must_include(:parse_rpc_response!)
      end
    end

  end
end