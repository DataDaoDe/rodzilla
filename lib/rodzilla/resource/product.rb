module Rodzilla
  module Resource
    class Product < Base

      REQUIRED_FIELDS = [:name, :description, :version]

      def get_selectable_products
      end

      def get_enterable_products
      end

      def get_accessible_products
        rpc_call( rpc_method: "get_accessible_products" )
      end

      def create

      end

      def update

      end

    end
  end
end