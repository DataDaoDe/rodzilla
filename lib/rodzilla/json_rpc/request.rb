module Rodzilla
  module JsonRpc
    class Request
      attr_accessor :id, :params, :method

      def initialize(id, method, params={})
        raise TypeError, "id must be an Integer" unless id.is_a?(Integer)
        raise TypeError, "method must a String" unless method.is_a?(String) && !method.empty?
        raise TypeError, "params must a Hash" unless params.is_a?(Hash)

        @id = id
        @method = method
        @params = params
      end

    end
  end
end