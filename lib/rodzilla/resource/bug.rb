module Rodzilla
  module Resource
    class Bug < Base

      def fields(params={})
        rpc_call :fields, params
      end

      def search(params={})
        rpc_call :search, params
      end

      def create(params={})
        rpc_call :create, params
      end

    end
  end
end