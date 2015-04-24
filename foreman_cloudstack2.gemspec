$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "foreman_cloudstack2/version"
require "date"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
	s.name        = "foreman_cloudstack2"
	s.version     = ForemanCloudstack2::VERSION
	s.date        = Date.today.to_s
	s.authors     = ["bytemine GmbH, Daniel Rauer"]
	s.email       = ["info@bytemine.net"]
	s.homepage    = "http://github.com/bytemine/foreman-cloudstack"
	s.summary     = "Provision and manage a Cloudstack Server from Foreman"
	s.description = "Provision and manage a Cloudstack Server from Foreman."
	s.licenses    = ["GPL-3"]

	s.add_development_dependency('rake')

	s.files = Dir["{app,config,db,lib,locale}/**/*", "LICENSE", "Rakefile", "README.md"]
	s.test_files = Dir["test/**/*"]

	s.add_dependency "fog"
end
