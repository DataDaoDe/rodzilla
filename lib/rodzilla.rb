require "httparty"
require "rodzilla/version"
require "rodzilla/bugzilla/version"

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

    def bugs; resource(:Bug); end

    def bugzilla; resource(:Bugzilla); end

    def classifications; resource(:Classification); end

    def groups; resource(:Group); end

    def products; resource(:Product); end

    def users; resource(:User); end

    def resource(name)
      unless Rodzilla.constants.include?(name)
        raise Rodzilla::ResourceNotSupportedError, "Error: Resource not supported"
      end
      name.to_s.classify
    end
  end
end
