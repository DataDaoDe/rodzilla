module Rodzilla
  module JsonRpc
    module Error

      # Raised if a JsonRpc Response id is not the same as the request id
      class InvalidResponseId < StandardError; ;end

      # Raised when any other method besides POST or GET is used
      class UnsupportedHttpMethod < StandardError; ;end

    end
  end
end