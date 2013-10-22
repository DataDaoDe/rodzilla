require 'test_helper'

describe Rodzilla::JsonRpc::Service do
  before do
    @service = Rodzilla::JsonRpc::Service.new('http://bugzilla.test.com/jsonrpc.cgi', 'user', 'passwd')
    @version_body = method_fixture('Bugzilla_version.json').read
  end

  it "generate_cycle_id should return 1" do
    @service.send(:generate_cycle_id).must_equal(1)
  end


  describe "send_request!" do


    it "should return a JSON Hash for a successfull API call" do
      stub_bugzilla_request('Bugzilla.version')
      @service.send_request!('Bugzilla.version').must_be_kind_of(Hash)
    end

  end

end