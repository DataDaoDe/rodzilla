require "httparty"
require "rodzilla/version"
require "rodzilla/resource/base"
require "rodzilla/resource/product"

module Rodzilla
  class WebService

    attr_accessor :base_url, :username, :password, :format 

    def initialize(base_url, username, password)
      @base_url = File.join(@base_url, "#{@format}rpc.cgi")
      @username = username
      @password = password
      @format   = :json
    end

    def bugzilla_resource(resource)
      raise Rodzilla::ResourceNotFound, "Error: #{resource} not found." unless Rodzilla::Resource.constants.include?(resource.to_sym)
      klass = Object.module_eval("Rodzilla::Resource::#{resource}").new(@base_url, @username, @password, @format)
    end

    def products
      bugzilla_resource('Product')
    end


  end
end
