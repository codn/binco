# $:.push File.expand_path("../lib", __FILE__)
#
# # Maintain your gem's version:
# require "bootstrap_on_rails/version"
require File.expand_path('../lib/binco/version', __FILE__)
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "binco"
  s.version     = Binco::VERSION
  s.authors     = ["Victor Camacho"]
  s.email       = ["victor@codn.mx"]
  s.homepage    = "http://github.com/codn/binco"
  s.summary     = "Bootstrap Sass for use in Ruby on Rails applications"
  s.description = "This Gems wraps adds a collection of helpers to help you integrate bootstrap into your Rails app."
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ['lib']

  s.add_dependency "railties", ">= 3.2", "<= 7"

  s.add_dependency "jquery-rails", '>= 4.3.1'

  s.add_development_dependency "activesupport", '~> 5.0'
  s.add_development_dependency "sass-rails", '~> 5.0'
end
