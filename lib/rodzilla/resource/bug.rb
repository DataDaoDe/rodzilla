module Rodzilla
  module Resource
    class Bug < Base

      def fields(params={})
        rpc_call( 'Bug.fields', params )
      end

      def search(params={})
        rpc_call( 'Bug.search', params )
      end

      def create!(params={})
        rpc_call( 'Bug.create', params )
      end

    end
  end
end