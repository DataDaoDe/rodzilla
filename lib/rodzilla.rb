require "httparty"
require "json"
require "rodzilla/version"
require "rodzilla/exception"

# load resources
require "rodzilla/resource/base"
require "rodzilla/resource/product"
require "rodzilla/resource/classification"
require "rodzilla/resource/bugzilla"
require "rodzilla/resource/bug"

module Rodzilla
  class WebService

    attr_accessor :base_url, :username, :password, :format 

    def initialize(base_url, username, password, format=:json)
      @base_url = base_url
      @username = username
      @password = password
      @format   = format
    end

    def products
      bugzilla_resource('Product')
    end

    def bugzilla
      bugzilla_resource('Bugzilla')
    end

    def classifications
      bugzilla_resource('Classification')
    end

    def bugs
      bugzilla_resource('Bug')
    end

    protected
      def bugzilla_resource(resource)
        raise Rodzilla::ResourceNotFoundError, "Error: #{resource} not found." unless Rodzilla::Resource.constants.include?(resource.to_sym)
        klass = Object.module_eval("Rodzilla::Resource::#{resource}").new(@base_url, @username, @password, @format)
      end


  end
end
