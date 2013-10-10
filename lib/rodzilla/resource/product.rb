module Rodzilla
  module Resource
    # Bugzilla::Webservice::Product - The Product API
    # This part of the Bugzilla API allows you to list the available Products and get information about them.
    class Product < Base

      # Returns a list of the ids of the products the user can search on.
      def get_selectable_products
        rpc_call( rpc_method: "get_selectable_products" )
      end

      def get_enterable_products
        rpc_call( rpc_method: "get_enterable_products" )
      end

      def get_accessible_products
        rpc_call( rpc_method: "get_accessible_products" )
      end

      def get_products(ids)
        rpc_call( rpc_method: "get", ids: ids )
      end
    end
  end
end