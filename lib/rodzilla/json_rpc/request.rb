module Rodzilla
  module JsonRpc
    class Request
      attr_accessor :id, :params, :method, :headers

      def initialize(&block)
        yield(self) if block_given?
      end

      def get_request_object
        {
          id: @id,
          method: @method,
          params: @params
        }
      end

      def serialize
        JSON.dump(get_request_object)
      end

    end
  end
end