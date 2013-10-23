require "test_helper"


describe Rodzilla::Resource::Base do
  before do
    @base_service = Rodzilla::Resource::Base.new(StubSettings::URL, StubSettings::USERNAME, StubSettings::PASSWORD)
  end

  it "attribute accessors" do
    [:base_url, :username, :password, :service, :format].each  { |m| @base_service.must_respond_to(m) }
    [:base_url=, :username=, :password=, :service=, :format=].each  { |m| @base_service.must_respond_to(m) }
  end

  describe "set_endpoint_url" do
    it "should accept one argument - format" do
      lambda { @base_service.send(:set_endpoint_url) }.must_raise(ArgumentError)
    end

    it "should return base_url joined with the jsonrpc endpoint when arg is json" do
      @base_service.send(:set_endpoint_url, :json).must_equal(@base_service.base_url + '/jsonrpc.cgi' )
    end
  end

  describe "setup_service" do
    it "should accept one argument - format" do
      lambda { @base_service.send(:setup_service) }.must_raise(ArgumentError)
    end

    it "should set @endpoint_url and instantiate JsonRpc::Service when format is json" do
      @base_service.service = nil
      @base_service.send(:setup_service, :json)
      @base_service.instance_variable_get(:@endpoint_url).must_equal(@base_service.base_url + '/jsonrpc.cgi' )
      @base_service.service.must_be_kind_of(Rodzilla::JsonRpc::Service)
    end
  end

  describe "check_params" do
    it "should return true if required is a subset of actual" do
      required = [:name, :age]
      actual = [:name, :age, :country]
      actual2 = { name: '', age: 33, country: 'DE' }

      @base_service.send(:check_params, required, actual ).must_equal(true)
      @base_service.send(:check_params, required, actual2 ).must_equal(true)
    end

    it "should return false if required is not a subset of actual" do
      required = [:a,:b, :c]
      actual = [:a, :b, :foo]
      actual2 = { a: '', b: 2, foo: 45 }
      @base_service.send(:check_params, required, actual ).must_equal(false)
      @base_service.send(:check_params, required, actual2 ).must_equal(false)
    end
  end

end