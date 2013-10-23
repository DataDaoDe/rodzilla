require 'test_helper'

describe Rodzilla::Util do

  describe "methods" do

    it "should have a module method demodulize" do
      Rodzilla::Util.must_respond_to(:demodulize)
    end
    
  end

  describe "demodulize" do

    it "should extract the classname from a module hierarchy" do
      Rodzilla::Util.demodulize(Rodzilla::Resource::Base).must_equal('Base')
    end

    it "should return the to_s version of other arguments" do
      Rodzilla::Util.demodulize(nil).must_equal("")
      Rodzilla::Util.demodulize(Rodzilla).must_equal("Rodzilla")
    end
  end

end