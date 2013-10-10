module Rodzilla
  module Resource
    class Bugzilla < Base

      def version
        rpc_call( rpc_method: 'version' )
      end

      def time
        rpc_call( rpc_method: 'time' )
      end

      def timezone
        rpc_call( rpc_method: 'timezone' )
      end

      def extensions
        rpc_call( rpc_method: 'extensions' )
      end

    end
  end
end