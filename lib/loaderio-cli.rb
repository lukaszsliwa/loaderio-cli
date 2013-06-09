lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'yaml'
require 'loaderio'
require 'active_support/core_ext/object'

require 'loaderio-cli/version'
require 'loaderio-cli/cli'
require 'loaderio-cli/config'
require 'loaderio-cli/command'
require 'loaderio-cli/command/app'
require 'loaderio-cli/command/test'

module LoaderioCLI
end
