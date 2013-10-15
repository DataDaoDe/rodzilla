module Rodzilla
  class WebService

    attr_accessor :base_url, :username, :password, :format

    # @param base_url [String]  the bugzilla full url
    # @param username [String]  the bugzilla authorized users username
    # @param password [String]  the bugzilla authorized users password
    # @param format   [Symbol]  the request/response format `:xml` or `:json`
    def initialize(base_url, username, password, format=:json)
      @base_url     = base_url
      @username     = username
      @password     = password
      @format       = format
    end

    def bugs
      bugzilla_resource('Bug')
    end

    def bugzilla
      bugzilla_resource('Bugzilla')
    end

    def classifications
      bugzilla_resource('Classification')
    end

    def groups
      bugzilla_resource('Group')
    end

    def products
      bugzilla_resource('Product')
    end

    def users
      bugzilla_resource('User')
    end


    def bugzilla_resource(resource)
      raise Rodzilla::Error::ResourceNotFoundError, "Error: Rodzilla::Resource::#{resource} does not exist." unless Rodzilla::Resource.constants.include?(resource.to_sym)
      klass = Object.module_eval("Rodzilla::Resource::#{resource}").new(@base_url, @username, @password, @format)
    end

    protected :bugzilla_resource

  end
end