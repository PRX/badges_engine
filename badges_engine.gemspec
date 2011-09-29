$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "badges_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "badges_engine"
  s.version     = BadgesEngine::VERSION
  s.authors     = ["Andrew Kuklewicz"]
  s.email       = ["andrew@prx.org"]
  s.homepage    = ""
  s.summary     = "Rails 3.1 Engine for Mozilla Open Badges Issuers"
  s.description = "Rails 3.1 Engine for Mozilla Open Badges Issuers"
  
  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  
  s.add_dependency 'rails', '~> 3.1.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'haml'
  s.add_dependency 'haml-rails'
  
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
end
