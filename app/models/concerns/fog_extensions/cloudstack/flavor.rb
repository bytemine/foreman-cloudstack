###########################################################################
# Written by / Copyright (C) 2015 bytemine GmbH                           #
# sponsored by ennit AG                                                   #
# Author: Daniel Rauer                      E-Mail:    rauer@bytemine.net #
#                                                                         #
# http://www.bytemine.net/                                                #
###########################################################################

module FogExtensions
	module Cloudstack
		module Flavor
			extend ActiveSupport::Concern

			def to_label
				"#{id} - #{name}"
			end

			def to_s
				name
			end
		end
	end
end
