module Rodzilla
  module Resource
    class Bugzilla < Base

      def version
        rpc_call :version
      end

      def time
        rpc_call :time
      end

      def timezone
        rpc_call :timezone
      end

      def extensions
        rpc_call :extensions
      end

    end
  end
end