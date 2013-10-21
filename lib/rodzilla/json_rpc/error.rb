module Rodzilla
  module JsonRpc
    module Error

      # Raised if a JsonRpc Response id is not the same as the request id
      class InvalidResponseId < StandardError
        attr_reader :request_id, :response_id

        def initialize(req_, res_id)
          @request_id = req_id
          @response_id = res_id
        end
        
      end

    end
  end
end