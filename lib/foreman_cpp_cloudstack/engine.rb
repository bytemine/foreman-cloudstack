###########################################################################
# Written by / Copyright (C) 2015 bytemine GmbH                           #
# sponsored by ennit AG                                                   #
# Author: Daniel Rauer                      E-Mail:    rauer@bytemine.net #
#                                                                         #
# http://www.bytemine.net/                                                #
###########################################################################

require 'fast_gettext'
require 'gettext_i18n_rails'
require 'fog'
require 'fog/cloudstack'
require 'fog/cloudstack/models/compute/server'

module ForemanCPPCloudstack
	#Inherit from the Rails module of the parent app (Foreman), not the plugin.
	#Thus, inherits from ::Rails::Engine and not from Rails::Engine
	class Engine < ::Rails::Engine
        engine_name 'foreman_cpp_cloudstack'

        config.autoload_paths += Dir["#{config.root}/app/models/concerns"]

		initializer 'foreman_cpp_cloudstack.register_gettext', :after => :load_config_initializers do |app|
			locale_dir    = File.join(File.expand_path('../../..', __FILE__), 'locale')
			locale_domain = 'foreman_cpp_cloudstack'

			Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
		end

		initializer 'foreman_cpp_cloudstack.register_plugin', :after => :finisher_hook do |app|
			Foreman::Plugin.register :foreman_cpp_cloudstack do
				requires_foreman '>= 1.7'
				compute_resource ForemanCPPCloudstack::Cloudstack
			end
		end
		
		config.to_prepare do
            begin
                Fog::Compute::Cloudstack::Server.send(:include, ::FogExtensions::Cloudstack::Server)
                Host::Managed.send(:include, ForemanCPPCloudstack::Compute)
            rescue => e
                puts "#{ForemanCPPCloudstack}: skipping engine hook (#{e.to_s})"
            end
        end
	end
end
