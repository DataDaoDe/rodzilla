module Rodzilla
  class WebService

    attr_accessor :base_url, :username, :password, :format, :service

    # base_url - The String full uri of the Bugzilla api server
    # username - The String containing the bugzilla authorized users username
    # password - The String containing the bugzilla authorized users password
    # format - The request/response format which defaults to :json
    def initialize(base_url, username, password, format=:json)
      @base_url     = base_url
      @username     = username
      @password     = password
      @format       = format
    end

    # Provide a shortcut for instantiation Bug objects
    #
    # Returns an instance of the Rodzilla::Resource::Bug class
    def bugs
      bugzilla_resource('Bug')
    end

    # Provide a shortcut for instantiation Bugzilla objects
    #
    # Returns an instance of the Rodzilla::Resource::Bugzilla class
    def bugzilla
      bugzilla_resource('Bugzilla')
    end

    # Provide a shortcut for instantiation Classification objects
    #
    # Returns an instance of the Rodzilla::Resource::Classification class
    def classifications
      bugzilla_resource('Classification')
    end

    # Provide a shortcut for instantiation Group objects
    #
    # Returns an instance of the Rodzilla::Resource::Group class
    def groups
      bugzilla_resource('Group')
    end

    # Provide a shortcut for instantiation Product objects
    #
    # Returns an instance of the Rodzilla::Resource::Product class
    def products
      bugzilla_resource('Product')
    end

    # Provide a shortcut for instantiation User objects
    #
    # Returns an instance of the Rodzilla::Resource::User class
    def users
      bugzilla_resource('User')
    end

    def bugzilla_resource(resource)
      raise Rodzilla::Error::ResourceNotFoundError, "Error: Rodzilla::Resource::#{resource} does not exist." unless Rodzilla::Resource.constants.include?(resource.to_sym)
      @service = Object.module_eval("Rodzilla::Resource::#{resource}").new(@base_url, @username, @password, @format)
    end

    protected :bugzilla_resource

  end
end