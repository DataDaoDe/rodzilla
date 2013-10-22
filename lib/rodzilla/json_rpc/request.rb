module Rodzilla
  module JsonRpc
    class Request
      attr_accessor :id, :params, :method, :headers

      def initialize(&block)
        yield(self) if block_given?
      end
    end
  end
end