require "her"
require "rodzilla/version"

module Rodzilla
  class Client
    include HTTParty
    include RequestMethods

    attr_accessor :base_uri, :username, :password, :request, :response

    def initialize(base_uri, username, password)
      @url      = base_uri
      @username = username
      @password = password
    end

  end
end
