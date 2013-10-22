module Rodzilla
  module JsonRpc
    class Request
      attr_accessor :id, :params, :method, :headers

      def initialize(&block)
        yield(self) if block_given?
      end

      def request_object
        {
          id: @id,
          method: @method,
          params: @params
        }
      end

      def as_json
        JSON.dump(request_object)
      end

    end
  end
end