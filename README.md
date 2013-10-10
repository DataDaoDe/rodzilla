# Rodzilla

This Ruby Gem tries its best to implement: [http://www.bugzilla.org/docs/tip/en/html/api/index.html](The Bugzilla API)

It only supports JSON and implements json-rpc
The JSON-RPC specification: [http://json-rpc.org/wiki/specification](JSON-RPC Specification)

Currently the Bugzilla REST API is experimental and not reliable, so this is not a REST API.

## Installation

Add this line to your application's Gemfile:

    gem 'rodzilla'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rodzilla

## Usage

````ruby
# get the Bugzilla list of available projects
require "rodzilla"
s = Rodzilla::WebService.new("https://example.com", "username", "password")
product_ids = s.products.get_accessible_products
s.products.get_products(product_ids) # OpenStruct.products -> Array of all products with names and extra info

# Find out specific information about required bug fields
s.bugs.fields

# There is also an alternative method for rpc resources objects
bug = Rodzilla::Resource::Bug.new("https://example.com", "username", "password", :json )
bug.fields

# TODO: Implement creation

````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
