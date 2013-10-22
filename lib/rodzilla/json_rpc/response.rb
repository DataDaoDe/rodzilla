module Rodzilla
  module JsonRpc
    class Response
      attr_accessor :result, :error, :id

      def initialize
        @error = nil
      end
      
      def read_http_response(http_response)
        body = http_response.parsed_response
        @id     = body["id"]
        @error  = body["error"]
        @result = body["result"]
        self
      end
      
    end
  end
end