module Rodzilla
  module JsonRpc
    module Error

      # Raised if a JsonRpc Response id is not the same as the request id
      class InvalidResponseId < StandardError; ;end

      # Raised when any other method besides POST or GET is used
      class UnsupportedHttpMethod < StandardError; ;end

      # Raised whenever the JsonRpc::Response#error attribute is not nil
      class ResponseError < StandardError
        attr_reader :code

        def initialize(code)
          @code = code
        end

      end

    end
  end
end