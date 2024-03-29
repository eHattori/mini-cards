# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rack-test/all/rack-test.rbi
#
# rack-test-0.6.3

module Rack
end
class Rack::MockSession
  def after_request(&block); end
  def clear_cookies; end
  def cookie_jar; end
  def cookie_jar=(arg0); end
  def default_host; end
  def initialize(app, default_host = nil); end
  def last_request; end
  def last_response; end
  def request(uri, env); end
  def set_cookie(cookie, uri = nil); end
end
module Rack::Test
  def self.encoding_aware_strings?; end
end
class Rack::Test::Cookie
  def <=>(other); end
  def default_uri; end
  def domain; end
  def empty?; end
  def expired?; end
  def expires; end
  def initialize(raw, uri = nil, default_host = nil); end
  def matches?(uri); end
  def name; end
  def path; end
  def raw; end
  def replaces?(other); end
  def secure?; end
  def valid?(uri); end
  def value; end
  include Rack::Utils
end
class Rack::Test::CookieJar
  def <<(new_cookie); end
  def [](name); end
  def []=(name, value); end
  def delete(name); end
  def for(uri); end
  def hash_for(uri = nil); end
  def initialize(cookies = nil, default_host = nil); end
  def merge(raw_cookies, uri = nil); end
  def to_hash; end
end
class Rack::Test::MockDigestRequest
  def initialize(params); end
  def method; end
  def method_missing(sym); end
  def response(password); end
end
module Rack::Test::Utils
  def build_file_part(parameter_name, uploaded_file); end
  def build_multipart(params, first = nil); end
  def build_nested_query(value, prefix = nil); end
  def build_parts(parameters); end
  def build_primitive_part(parameter_name, value); end
  def get_parts(parameters); end
  def self.build_multipart(params, first = nil); end
  def self.build_nested_query(value, prefix = nil); end
  include Rack::Utils
end
module Rack::Test::Methods
  def _current_session_names; end
  def authorize(*args, &block); end
  def basic_authorize(*args, &block); end
  def build_rack_mock_session; end
  def build_rack_test_session(name); end
  def clear_cookies(*args, &block); end
  def current_session; end
  def delete(*args, &block); end
  def digest_authorize(*args, &block); end
  def env(*args, &block); end
  def follow_redirect!(*args, &block); end
  def get(*args, &block); end
  def head(*args, &block); end
  def header(*args, &block); end
  def last_request(*args, &block); end
  def last_response(*args, &block); end
  def options(*args, &block); end
  def patch(*args, &block); end
  def post(*args, &block); end
  def put(*args, &block); end
  def rack_mock_session(name = nil); end
  def rack_test_session(name = nil); end
  def request(*args, &block); end
  def set_cookie(*args, &block); end
  def with_session(name); end
  extend Forwardable
end
class Rack::Test::UploadedFile
  def content_type; end
  def content_type=(arg0); end
  def initialize(path, content_type = nil, binary = nil); end
  def local_path; end
  def method_missing(method_name, *args, &block); end
  def original_filename; end
  def path; end
  def respond_to?(method_name, include_private = nil); end
  def tempfile; end
end
class Rack::Test::Error < StandardError
end
class Rack::Test::Session
  def authorize(username, password); end
  def basic_authorize(username, password); end
  def clear_cookies(*args, &block); end
  def default_env; end
  def delete(uri, params = nil, env = nil, &block); end
  def digest_auth_configured?; end
  def digest_auth_header; end
  def digest_authorize(username, password); end
  def env(name, value); end
  def env_for(path, env); end
  def follow_redirect!; end
  def get(uri, params = nil, env = nil, &block); end
  def head(uri, params = nil, env = nil, &block); end
  def header(name, value); end
  def headers_for_env; end
  def initialize(mock_session); end
  def last_request(*args, &block); end
  def last_response(*args, &block); end
  def options(uri, params = nil, env = nil, &block); end
  def params_to_string(params); end
  def patch(uri, params = nil, env = nil, &block); end
  def post(uri, params = nil, env = nil, &block); end
  def process_request(uri, env); end
  def put(uri, params = nil, env = nil, &block); end
  def request(uri, env = nil, &block); end
  def retry_with_digest_auth?(env); end
  def set_cookie(*args, &block); end
  extend Forwardable
  include Rack::Test::Utils
end
