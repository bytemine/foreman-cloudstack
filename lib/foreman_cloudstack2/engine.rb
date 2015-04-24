require 'fast_gettext'
require 'gettext_i18n_rails'
require 'fog'
require 'fog/cloudstack'
require 'fog/cloudstack/models/compute/server'

module ForemanCloudstack2
	#Inherit from the Rails module of the parent app (Foreman), not the plugin.
	#Thus, inherits from ::Rails::Engine and not from Rails::Engine
	class Engine < ::Rails::Engine
        engine_name 'foreman_cloudstack2'

        config.autoload_paths += Dir["#{config.root}/app/models/concerns"]

		initializer 'foreman_cloudstack2.register_gettext', :after => :load_config_initializers do |app|
			locale_dir    = File.join(File.expand_path('../../..', __FILE__), 'locale')
			locale_domain = 'foreman_cloudstack2'

			Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
		end

		initializer 'foreman_cloudstack2.register_plugin', :after => :finisher_hook do |app|
			Foreman::Plugin.register :foreman_cloudstack2 do
				requires_foreman '>= 1.7'
				compute_resource ForemanCloudstack2::Cloudstack
			end

		end
		
		config.to_prepare do
            begin
            Fog::Compute::Cloudstack::Server.send(:include, ::FogExtensions::Cloudstack::Server)
            rescue => e
                puts "#{ForemanCloudstack2}: skipping engine hook (#{e.to_s})"
            end
        end

	end
end
