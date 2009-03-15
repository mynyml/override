#require 'pathname'
require 'test/unit'
require 'rubygems'
require 'context'
require 'matchy'
#require 'zebra'
#require 'mocha'
begin
  require 'ruby-debug'
  require 'quietbacktrace'
rescue LoadError, RuntimeError
  # pass
end
