module Rodzilla
  module Resource
    class Base
      attr_accessor :base_url, :username, :password, :service
      
      def initialize(base_url, username, password)
        @base_url = base_url
        @username = username
        @password = password
        @service = Rodzilla::JsonRpc::Service.new(@base_url, @username, @password)
      end

      def rpc_call(rpc_method=nil, params={}, http_method=:post)
        service.send_request!(rpc_method, params, http_method)
      end

      

      protected
      
        def prepare_request(params={})
          @request_url  = build_url
          @params       = build_params(params)
        end

        def build_url
          File.join("#{@base_url}", "#{@format}rpc.cgi")
        end

        def build_params(params={})
          rpc_method = params.delete(:rpc_method)
          { params: [@credentials.merge(params)], method: "#{Rodzilla::Util.demodulize(self.class)}.#{rpc_method}", id: make_id }
        end

        def make_id
          @@_request_id += 1
        end

        def rpc_call(params={})
          prepare_request( params )
          @response = self.class.post(@request_url, body: JSON.dump(@params), headers: @headers )
          parse_rpc_response!
        end

        def parse_rpc_response!
          begin
            res = @response.parsed_response
            if err = res["error"]
              raise Rodzilla::JsonRpcResponseError, "Error (#{err['code']}): #{err['message']}"
            end
            @result = res["result"]
          rescue => ex
            raise ex
          end
          @result
        end

    end
  end
end
