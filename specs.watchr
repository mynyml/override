# Run me with:
#
#   $ watchr specs.watchr

# --------------------------------------------------
# Helpers
# --------------------------------------------------
def run(cmd)
  puts(cmd)
  system(cmd)
end

def run_all_tests
  # see Rakefile for the definition of the test:all task
  system( "rake -s test:all VERBOSE=true" )
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch( '^test/test_override\.rb' )  { run( "ruby -rubygems -I.:lib test/test_override.rb" ) }
watch( '^lib/override\.rb'       )  { run( "ruby -rubygems -I.:lib test/test_override.rb" ) }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Running all tests ---\n\n"
  run_all_tests
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }

