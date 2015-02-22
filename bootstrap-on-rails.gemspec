# $:.push File.expand_path("../lib", __FILE__)
#
# # Maintain your gem's version:
# require "bootstrap_on_rails/version"
require File.expand_path('../lib/bootstrap-on-rails/version', __FILE__)
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap-on-rails"
  s.version     = BootstrapOnRails::VERSION
  s.authors     = ["Victor Camacho"]
  s.email       = ["victor@codn.mx"]
  s.homepage    = "http://github.com/vicocamacho/bootstrap-on-rails"
  s.summary     = "Bootstrap Sass for use in Ruby on Rails applications"
  s.description = "This Gems wraps the bootstrap-sass gem and adds a collection of helpers to help you integrate bootstrap into your Rails app."
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ['lib']

  s.add_dependency "railties", ">= 3.2", "< 5.0"

  s.add_development_dependency "activesupport"
  s.add_development_dependency "sass-rails"
end

# # -*- encoding: utf-8 -*-
# require File.expand_path('../lib/font-awesome-rails/version', __FILE__)
#
# Gem::Specification.new do |gem|
#   gem.authors       = ["bokmann"]
#   gem.email         = ["dbock@codesherpas.com"]
#   gem.description   = "I like font-awesome. I like the asset pipeline. I like semantic versioning. If you do too, you're welcome."
#   gem.summary       = "an asset gemification of the font-awesome icon font library"
#   gem.homepage      = "https://github.com/bokmann/font-awesome-rails"
#   gem.licenses      = ["MIT", "SIL Open Font License"]
#
#   gem.files         = Dir["{app,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
#   gem.test_files    = Dir["test/**/*"]
#   gem.name          = "font-awesome-rails"
#   gem.require_paths = ["lib"]
#   gem.version       = FontAwesome::Rails::VERSION
#
#   gem.add_dependency "railties", ">= 3.2", "< 5.0"
#
#   gem.add_development_dependency "activesupport"
#   gem.add_development_dependency "sass-rails"
#
#   gem.required_ruby_version = '>= 1.9.3'
# end
