[![Build Status](https://travis-ci.org/jwaterfaucett/rodzilla.png)](https://travis-ci.org/jwaterfaucett/rodzilla)

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

## Architecture
Rodzilla never sets any class variables for the Bugzilla Host URL (unlike activeresource), mainly because doing this allows you to
instantiate as many objects as you want and have them all access different Bugzilla Services in the same process without collision problems.

## Usage

````ruby
# get the Bugzilla list of available projects
require "rodzilla"
service = Rodzilla::WebService.new("https://example.com", "username", "password")
product_ids = service.products.get_accessible_products
service.products.get_products(product_ids) # Array of all products with names and extra info

# Find out specific information about required bug fields
service.bugs.fields

# There is also an alternative method for rpc resources objects
bug = Rodzilla::Resource::Bug.new("https://example.com", "username", "password", :json )
bug.fields

# Searching is also easy
# for more info see: http://www.bugzilla.org/docs/tip/en/html/api/Bugzilla/WebService/Bug.html#search
bug.search( product: [ 'Test-Product' ] )

# Bug Creation
service.bugs.create!( product: 'Demo Product', 
  component: 'Some Component',
  summary: 'demo bla di bla',
  description: 'demo bladi bla',
  op_sys: 'iPhone OS',
  platform: 'PC',
  priority: 'High',
  severity: 'minor',
  version: 'unspecified'
) # => { "id" => 9832 }
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
