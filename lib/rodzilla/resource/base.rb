module Rodzilla
  module Resource
    class Base
      include HTTParty
      attr_accessor :base_url, :username, :password, :format , :request_url, :response
      
      def initialize(base_url, username, password, format)
        @base_url = base_url
        @username = username
        @password = password
        @format   = format
      end

      def self.prepare_request(params)
        @request_url  = self.class.build_url
        @params       = self.class.build_params(params)
      end

      def self.build_url
        File.join("#{@base_url}", "#{@format}rpc.cgi")
      end

      def self.build_params(params={})
        { Bugzilla_login: @username, Bugzilla_password: @password }.merge(params)
      end

    end
  end
end