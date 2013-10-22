module Rodzilla
  module JsonRpc
    class Response
      attr_accessor :result, :error, :id

      
      def read_http_response(http_response)
        http_response.parsed_response.tap do |body|
          id     = body["id"]
          error  = body["error"]
          result = body["result"]
        end
      end
      
    end
  end
end