require "httparty"
require "rodzilla/version"
require "rodzilla/bugzilla/bugzilla"

module Rodzilla
  class Client
    include HTTParty

    attr_accessor :base_url, :username, :password,
                  :request_url, :format

    def initialize(base_url, username, password)
      @base_url = File.join(@base_url, "#{@format}rpc.cgi")
      @username = username
      @password = password
      @format   = :json
    end

    def call_bugzilla_method(method)

    end

  end
end
