module Rodzilla
  module Resource
    # Bugzilla::Webservice::Product - The Product API
    # This part of the Bugzilla API allows you to list the available Products and get information about them.
    class Product < Base

      # Returns a list of the ids of the products the user can search on.
      def get_selectable_products
        rpc_call 'Product.get_selectable_products'
      end

      def get_enterable_products
        rpc_call 'Product.get_selectable_products'
      end

      def get_accessible_products
        rpc_call 'get_accessible_products'
      end

      def get_products(params={})
        rpc_call 'get', params
      end
    end
  end
end