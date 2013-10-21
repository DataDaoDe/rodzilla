module Rodzilla
  module JsonRpc

    class Service
      include HTTParty

      attr_accessor :json_rpc_request, :json_rpc_response,
                    :username, :password, :base_url

      def initialize(base_url, username, password, &block)
        @base_url = base_url
        @username = username
        @password = password

        @headers = {
          "Content-Type" => 'application/json-rpc'
        }
        
        yield(self) if block_given?
      end

      def send_request!(http_method=:post, rpc_method, params)
        json_rpc_request = Rodzilla::JsonRpc::Request.new(generate_cycle_id, rpc_method, params)
        post_request if http_method.to_s.downcase == 'post'
      end

      def post_request
        @http_response = self.class.post(@request_url, body: json_rpc_request.params, headers: @headers )
        parse_http_response
        raise Rodzilla::JsonRpc::InvalidResponseId unless check_cycle_id
      end


      private

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
          @result
        end

    end

  end
end