$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_error/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_error"
  s.version     = UserError::VERSION
  s.authors     = ["Lleir Borras Metje", "Marcello Barnaba"]
  s.email       = ["l.borrasmetje@ifad.org", "vjt@openssl.it"]

  s.description = %q{Display better errors on rails apps with bootstrap}
  s.summary     = %q{Users always make mistakes ad we have to explain them in a better way what did they do wrong.}
  s.homepage    = "http://github.com/ifad"
  s.license     = "MIT"

  s.files       = `git ls-files`.split("\n")
  s.test_files  = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 7.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "bundler", "~> 2.4"
  s.add_development_dependency "rake"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-nav"
end
