module Rodzilla
  module JsonRpc

    class Service
      include HTTParty

      attr_accessor :json_rpc_request, :json_rpc_response,
                    :username, :password, :url

      def initialize(url, username, password)
        @url = url
        @username = username
        @password = password
        setup_request
      end

      def send_request!(rpc_method, params={}, http_method=:post)

        json_rpc_request.method = rpc_method
        json_rpc_request.params = params

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
        @http_response = self.class.post(@url, body: json_rpc_request.serialize, headers: json_rpc_request.headers )
        parse_http_response
        raise Rodzilla::JsonRpc::InvalidResponseId unless check_cycle_id
      end

      def get_request
        @http_response = self.class.post(@url, body: json_rpc_request.serialize )
      end


      private

        def setup_request
          json_rpc_request = Rodzilla::JsonRpc::Request.new do |request|
            request.headers = { 'Content-Type' => 'application/json-rpc' }
            request.id = generate_cycle_id
          end
        end

        def generate_cycle_id; Random.rand(1..20); end

        def check_cycle_id
          return false if json_rpc_request.id != json_rpc_response.id
          true
        end

        def parse_http_response
          begin
            json_rpc_response = Rodzilla::JsonRpc::Response.new(@http_response.parsed_response)
          rescue => ex
            raise ex
          end
          json_rpc_response
        end

    end

  end
end