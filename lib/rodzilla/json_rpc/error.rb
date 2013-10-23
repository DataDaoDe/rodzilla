module Rodzilla
  module JsonRpc
    module Error

      # Raised if a JsonRpc Response id is not the same as the request id
      class InvalidResponseId < StandardError; ;end

      # Raised when any other method besides POST or GET is used
      class UnsupportedHttpMethod < StandardError; ;end

      # Raised whenever the JsonRpc::Response#error attribute is not nil
      #
      # Also inherited by Client & ServerError for handling HTTP Status Codes
      class ResponseError < StandardError
        attr_reader :code

        def initialize(code)
          @code = code
        end

      end

      # Raised when the HTTP Response Status Code is in the 400 Range
      class ClientError < ResponseError; ;end

      # Raised when the HTTP Response Status Code is in the 500 Range
      class ServerError < ResponseError; ;end

      # Raised when something goes wrong with the raw HTTP Request
      class HttpError < StandardError; ;end


    end
  end
end