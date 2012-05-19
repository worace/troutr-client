# -*- encoding: utf-8 -*-
require File.expand_path('../lib/troutr_client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Horace Williams"]
  gem.email         = ["horacedwilliams@gmail.com"]
  gem.description   = %q{Gem client for interacting with the troutr API}
  gem.summary       = %q{Gem client for interacting with the troutr API}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "troutr_client"
  gem.require_paths = ["lib"]
  gem.version       = Troutr::VERSION

  gem.add_runtime_dependency 'faraday'
end

