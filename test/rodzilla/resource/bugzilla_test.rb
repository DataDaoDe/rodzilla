require 'test_helper'

describe Rodzilla::Resource::Bugzilla do
  before do
    @bugzilla = new_resource('Bugzilla')
  end

  describe "api methods" do

    it { @bugzilla.must_respond_to('version') }
    it { @bugzilla.must_respond_to('time') }
    it { @bugzilla.must_respond_to('timezone') }
    it { @bugzilla.must_respond_to('extensions') }

  end

end