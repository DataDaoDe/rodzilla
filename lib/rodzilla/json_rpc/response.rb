module Rodzilla
  module JsonRpc
    class Response
      attr_accessor :result, :error, :id

      def initialize(result, error, id)

      end
      
    end
  end
end