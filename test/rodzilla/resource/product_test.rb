require 'test_helper'

describe Rodzilla::Resource::Product do
  before do
    @product = new_resource('Product')
  end

  describe "api methods" do

    it { @product.must_respond_to('get_selectable_products') }
    it { @product.must_respond_to('get_enterable_products') }
    it { @product.must_respond_to('get_accessible_products') }
    it { @product.must_respond_to('get_products') }

  end

end