module Rodzilla
  module Resource
    class Base
      attr_accessor :base_url, :username, :password, :service, :format
      
      def initialize(base_url, username, password, format=:json)
        @base_url = base_url
        @username = username
        @password = password
        @format = format

        setup_service
      end

      def rpc_call(rpc_method=nil, params={}, http_method=:post)
        service.send_request!(rpc_method, params, http_method)
      end

      protected
        def setup_service
          case @format.to_s.downcase
          when "json"
            @service  = Rodzilla::JsonRpc::Service.new(endpoint_url, @username, @password)
          end
        end

        def endpoint_url
          File.join(@base_url, 'jsonrpc.cgi')
        end

    end
  end
end
