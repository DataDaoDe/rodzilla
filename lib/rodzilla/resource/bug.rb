module Rodzilla
  module Resource
    class Bug < Base

      def fields
        rpc_call( rpc_method: "fields" )
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
        rpc_call( query.merge(rpc_method: 'search') )
      end

    end
  end
end