module Rodzilla
  module Resource
    class Base
      @@_request_id = 1
      include HTTParty
      attr_accessor :base_url, :username, :password, :format, 
                    :request_url, :response, :result, :credentials
      
      def initialize(base_url, username, password, format=:json)
        @base_url = base_url
        @username = username
        @password = password
        @format   = format
        @credentials = {
          Bugzilla_login: @username,
          Bugzilla_password: @password
        }
        @headers = { "Content-Type" => 'application/json-rpc' }
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
          { params: [@credentials.merge(params)], method: "#{self.class.demodulize(self.class)}.#{rpc_method}", id: make_id }
        end

        def self.demodulize(path)
          path = path.to_s
          if i = path.rindex('::')
            path[(i+2)..-1]
          else
            path
          end
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
