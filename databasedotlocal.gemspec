# -*- encoding: utf-8 -*-
require File.expand_path('../lib/databasedotlocal/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Eric J. Holmes"]
  gem.email         = ["eric@ejholmes.net"]
  gem.description   = %q{A Rack application to mock the Database.com/Salesforce.com REST API.}
  gem.summary       = %q{A Rack application to mock the Database.com/Salesforce.com REST API.}
  gem.homepage      = "https://github.com/ejholmes/databasedotlocal"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "databasedotlocal"
  gem.require_paths = ["lib"]
  gem.version       = Databasedotlocal::VERSION

  gem.add_dependency "sinatra", "~> 1.3.0"

  gem.add_development_dependency "rspec"
end
