$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_error/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_error"
  s.version     = UserError::VERSION
  s.authors       = ["Lleir Borras Metje"]
  s.email         = ["l.borrasmetje@ifad.org"]
  s.description   = %q{Display better errors on rails apps with bootstrap}
  s.summary       = %q{Users always make mistakes ad we have to explain them in a better way what did they do wrong.}
  s.homepage      = "http://www.ifad.org"
  s.license       = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
end
