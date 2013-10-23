require 'minitest/spec'
require 'minitest/autorun'
require 'webmock/minitest'
require "rodzilla"

# ========================
# Fixtures
# ========================
def method_fixture(name); fixture(name, :methods); end
def error_fixture(name); fixture(name, :errors); end

def fixture(name, type)
  path = fixture_path(name, type)
  File.new(path)
end

def fixture_path(filename, type=:methods)
  File.expand_path(File.join(Dir.getwd, "test/fixtures", type.to_s, filename))
end

# ========================
# Stubs
# ========================

class StubSettings
  URL = 'http://bugzilla.test.com'
  USERNAME = 'bugzilla'
  PASSWORD = 'bugzilla'

  JSON_URL = URL + '/jsonrpc.cgi'
  JSON_HEADERS = {
    "Server"                  =>  "Apache/2.2.22 (Debian)",
    "X-xss-protection"        =>  "1; mode=block",
    "X-frame-options"         => "SAMEORIGIN",
    "X-content-type-options"  => "nosniff", 
    "Keep-Alive"              => "timeout=5, max=100",
    "Connection"              => "Keep-Alive",
    "Transfer-Encoding"       => "chunked",
    "Content-Type"            => "application/json; charset=UTF-8"
  }

end

def new_resource(resource)
  Object.module_eval("Rodzilla::Resource::#{resource}").new(StubSettings::URL, StubSettings::USERNAME, StubSettings::PASSWORD)
end

def stub_bugzilla_request(rpc_name, type=:methods, http_method=:post)
  filename =  rpc_name.gsub('.', '_') + ".json"
  raw_json = fixture(filename, type).read
  WebMock.stub_request(http_method, StubSettings::JSON_URL ).to_return( body: raw_json, headers: StubSettings::JSON_HEADERS )
end