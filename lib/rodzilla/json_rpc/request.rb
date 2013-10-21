module Rodzilla
  module JsonRpc
    class Request
      attr_accessor :id, :params, :method
    end
  end
end