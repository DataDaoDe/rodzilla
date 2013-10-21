require "httparty"
require "json"

module Rodzilla
  
  autoload :VERSION, 'rodzilla/version'
  autoload :Error, 'rodzilla/error'
  autoload :WebService, 'rodzilla/web_service'

  module JsonRpc
    autoload :Service, 'rodzilla/json_rpc/service'
    autoload :Request, 'rodzilla/json_rpc/request'
    autoload :Response, 'rodzilla/json_rpc/response'
  end

  module Resource
    autoload :Base,   'rodzilla/resource/base'
    autoload :Bug,    'rodzilla/resource/bug'
    autoload :Bugzilla, 'rodzilla/resource/bugzilla'
    autoload :Classification, 'rodzilla/resource/classification'
    autoload :Group, 'rodzilla/resource/group'
    autoload :Product, 'rodzilla/resource/product'
    autoload :User, 'rodzilla/resource/user'
  end

end
