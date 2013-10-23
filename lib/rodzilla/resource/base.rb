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

      def rpc_call(rpc_method_name, params={}, http_method=:post)
        rpc_method = [Rodzilla::Util.demodulize(self.class), rpc_method_name.to_s].join('.')
        service.send_request!(rpc_method, params, http_method)
      end

      protected
        def setup_service
          case @format
          when :json
            @endpoint_url = set_endpoint_url(:json)
            @service  = Rodzilla::JsonRpc::Service.new(@endpoint_url, @username, @password)
          end
        end

        def set_endpoint_url(type=nil)
          case type
          when :json
            File.join(@base_url, 'jsonrpc.cgi')
          end
        end

        def check_params(required=[], actual)
          if actual.is_a?(Hash)
            (required - actual.keys).length == 0
          else
            (required - actual).length == 0
          end
        end

    end
  end
end
