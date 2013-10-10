module Rodzilla
  module Resource
    class Bug < Base

      def fields
        rpc_call( rpc_method: 'fields' )
      end

    end
  end
end