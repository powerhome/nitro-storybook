$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "playbook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "playbook"
  spec.version     = Playbook::VERSION
  spec.authors     = ["Power UX", "Power Developers"]
  spec.email       = ["nitroux@powerhrg.com", "dev@powerhrg.com"]
  spec.homepage    = "http://techatpower.com"
  spec.summary     = "Playbook Design System"
  spec.description = "Description of Playbook."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.1.6", "< 6.0"

  spec.add_development_dependency "sqlite3"

  spec.add_dependency "sassc-rails", "1.3.0"
  spec.add_dependency "sprockets-rails", "2.3.3"

  spec.add_development_dependency "test-unit", "3.1.5"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "simplecov", "0.10.0"
  spec.add_development_dependency "rubocop", "0.49.1"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "rainbow", "2.1.0"
  spec.post_install_message = %q{
    Playbook Design System has been installed!
    Visit http://playbook.powerapp.cloud for documentation.
    or spin it up by following the readme.
  }
end
