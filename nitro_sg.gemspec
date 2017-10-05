$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'nitro_sg/version'

Gem::Specification.new do |s|
  s.name        = "nitro_sg"
  s.version     = NitroSg::VERSION
  s.authors     = ["Nitro Developers"]
  s.email       = ["dev@powerhrg.com"]
  s.homepage    = "http://nitro.powerhrg.com"
  s.summary     = "Nitro's visual theme"
  s.description = "Nitro's visual theme, including page layout, styling and navigation"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]

  s.add_dependency "rails", "4.2.9"
  s.add_dependency "sassc-rails", "1.3.0"
  s.add_dependency "sprockets-rails", "2.3.3"

  s.add_development_dependency "test-unit", "3.1.5"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov", "0.10.0"
  s.add_development_dependency "rubocop", "0.49.1"
  s.add_development_dependency "yard"
  s.add_development_dependency "rainbow", "2.1.0" # locked due to a Rubygems bug exposed in Rainbow 2.2.0. see https://www.pivotaltracker.com/story/show/139302571
end
