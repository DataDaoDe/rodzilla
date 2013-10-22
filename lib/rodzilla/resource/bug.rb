module Rodzilla
  module Resource
    class Bug < Base
      REQUIRED_FIELDS = [:product, :component, :summary, :version, :description, :op_sys, :platform, :priority, :severity]

      def fields(params={})
        rpc_call( :fields, params )
      end

      # Returns all comments associated with a Bug
      def comments(params={})
        raise ArgumentError, "Error: comments requires that bug_id be set" unless params[:ids]
      end

      # Unless otherwise specified in the description of a parameter,
      # bugs are returned if they match exactly the criteria you specify in these parameters.
      # That is, we don't match against substrings--if a bug is in the "Widgets" product and you ask for bugs in the "Widg" product, you won't get anything.
      # 
      # Criteria are joined in a logical AND. 
      # That is, you will be returned bugs that match all of the criteria, not bugs that match any of the criteria.
      # 
      # Each parameter can be either the type it says, or an array of the types it says.
      # If you pass an array, it means "Give me bugs with any of these values."
      # For example, if you wanted bugs that were in either the "Foo" or "Bar" products, you'd pass:
      # 
      # Valid values:
      # product, url, id, alias, limit
      def search(query={})
        rpc_call( :search, query )
      end

      # see: http://www.bugzilla.org/docs/tip/en/html/api/Bugzilla/WebService/Bug.html#create
      # 
      # Required Fields:
      # product (string) Required - The name of the product the bug is being filed against.
      # component (string) Required - The name of a component in the product above.
      # summary (string) Required - A brief description of the bug being filed.
      # version (string) Required - A version of the product above; the version the bug was found in.
      # description (string) Defaulted - The initial description for this bug. Some Bugzilla installations require this to not be blank.
      # op_sys (string) Defaulted - The operating system the bug was discovered on.
      # platform (string) Defaulted - What type of hardware the bug was experienced on.
      # priority (string) Defaulted - What order the bug will be fixed in by the developer, compared to the developer's other bugs.
      # severity (string) Defaulted - How severe the bug is.
      # 
      # Raises an exception if a required field is not provided
      def create!(params={})
        REQUIRED_FIELDS.each { |field| raise ArgumentError, "Error: #{field} is required" unless params[field] }
        rpc_call( params.merge(rpc_method: 'create' ))
      end

      def create(params={})
        rpc_call( params.merge(rpc_method: 'create'))
      end
      
    end
  end
end