ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Need this to change the default port/host
require 'rails/commands/server'

module Rails
	class Server
		def default_options
	      super.merge(
            Port: 4000, Host: 'localhost'
          )
		end
	end
end
