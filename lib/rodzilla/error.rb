module Rodzilla
  module Error
    class ResourceNotFoundError < StandardError; ;end
    class JsonRpcResponseError < StandardError; ;end
  end
end