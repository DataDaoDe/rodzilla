module Rodzilla
  module JsonRpc
    class Response
      attr_accessor :result, :error, :id

      
      # 
      # 
      def read_http_response(http_response)
        body = http_response.parsed_response
        raise body.inspect
      end
      
    end
  end
end