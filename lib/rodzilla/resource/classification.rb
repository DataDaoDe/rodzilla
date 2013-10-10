module Rodzilla
  module Resource
    # Bugzilla::Webservice::Classification - The Classification API
    # This part of the Bugzilla API allows you to deal with the available Classifications.
    # You will be able to get information about them as well as manipulate them.
    class Classification < Base

      # Returns a hash containing information about a set of classifications.
      def get(ids)
        rpc_call( rpc_method: "get", ids: ids )
      end

    end
  end
end