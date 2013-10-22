module Rodzilla
  module JsonRpc
    module Error

      # Raised if a JsonRpc Response id is not the same as the request id
      class InvalidResponseId < StandardError; ;end

      class UnsupportedHttpMethod < StandardError; ;end

    end
  end
end