require 'test_helper'

describe Rodzilla::Resource::Bug do
  before do
    @bug = new_resource('Bug')
  end

  describe "api methods" do

    it { @bug.must_respond_to('fields') }
    it { @bug.must_respond_to('search') }
    it { @bug.must_respond_to('attachments') }
    it { @bug.must_respond_to('get') }
    it { @bug.must_respond_to('get_bugs') }
    it { @bug.must_respond_to('comments') }
    it { @bug.must_respond_to('create!') }
    it { @bug.must_respond_to('create') }
    it { @bug.must_respond_to('add_attachment!') }
    it { @bug.must_respond_to('add_attachment') }
    it { @bug.must_respond_to('update') }

  end

end
