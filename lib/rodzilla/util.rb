module Rodzilla
  module Util

    # Extracts the class name from a module string
    # 
    # example:
    #  demodulize( Rodzilla::WebService::Error ) => 'Error'
    # 
    # returns the String path argument
    def demodulize(path)
      path = path.to_s
      if i = path.rindex('::')
        path[(i+2)..-1]
      else
        path
      end
    end

    module_function :demodulize

  end
end