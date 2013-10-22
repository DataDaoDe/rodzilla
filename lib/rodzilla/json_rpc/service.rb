module Rodzilla
  module JsonRpc

    class Service
      include HTTParty

      attr_accessor :rpc_request, :rpc_response,
                    :username, :password, :credentials, :url

      def initialize(url, username, password)
        @url = url
        @username = username
        @password = password
        @credentials = {
          Bugzilla_login: @username,
          Bugzilla_password: @password
        }
      end

      def send_request!(rpc_method, params={}, http_method=:post)
        setup_request
        setup_request_data(rpc_method, params)

        case http_method.to_s.downcase
        when 'post'
          post_request
        when 'get'
          get_request
        else
          raise Rodzilla::JsonRpc::Error::UnsupportedHttpMethod, "Error: Only GET and POST request are supported HTTP methods."
        end

      end

      def post_request
        @http_response = self.class.post( @url, body: rpc_request.serialize, headers: rpc_request.headers )
        parse_http_response
        raise Rodzilla::JsonRpc::InvalidResponseId unless check_cycle_id
        rpc_response
      end

      def get_request
        @http_response = self.class.post(@url, body: rpc_request.serialize, headers: rpc_request.headers )
        parse_http_response
        raise Rodzilla::JsonRpc::InvalidResponseId unless check_cycle_id
        rpc_response
      end


      private

        # Sets the Content-Type to application/json-rpc for the Service
        # also adds Bugzilla defined login/password to the request parameters
        # 
        # sets id for the request which is later checked using check_cycle_id
        # 
        # Return 
        def setup_request
          user_auth = @credentials
          @rpc_request = Rodzilla::JsonRpc::Request.new do |request|
            request.headers = { 'Content-Type' => 'application/json-rpc' }
            request.id = generate_cycle_id
          end
        end

        def setup_request_data(rpc_method, params={})
          @rpc_request.method = rpc_method
          @rpc_request.params = @credentials.merge(params)
        end

        def generate_cycle_id; Random.rand(1..20); end

        def check_cycle_id
          return false if rpc_request.id != rpc_response.id
          true
        end

        def parse_http_response
          begin
            rpc_response = Rodzilla::JsonRpc::Response.new
            rpc_response.read_http_response(@http_response)
          rescue => ex
            raise ex
          end
          rpc_response
        end

    end

  end
end