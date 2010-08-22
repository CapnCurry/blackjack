require 'rspec'

root = File.expand_path("../..", __FILE__)

$LOAD_PATH.unshift(File.join(root, 'lib'))
require 'blackjack'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(root, "spec/support/**/*.rb")].each { |f| require f }
