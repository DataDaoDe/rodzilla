require "test_helper"


describe Rodzilla::Resource::Base do
  before do
    @base_service = Rodzilla::Resource::Base.new(StubSettings::URL, StubSettings::USERNAME, StubSettings::PASSWORD)
  end

  it "attribute accessors" do
    [:base_url, :username, :password, :service, :format].each  { |m| @base_service.must_respond_to(m) }
    [:base_url=, :username=, :password=, :service=, :format=].each  { |m| @base_service.must_respond_to(m) }
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