module Rodzilla
  module Resource
    class Product < Base

      REQUIRED_FIELDS = [:name, :description, :version]

      def get_selectable_products
      end

      def get_enterable_products
      end

      def get_accessible_products
        prepare_request
        @response = self.class.get(@request_url, @params)
        puts @response.inspect
      end

      def create

      end

      def update

      end

    end
  end
end