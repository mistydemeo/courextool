# -*- encoding: utf-8 -*-
require File.expand_path('../lib/courex/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Misty De Meo"]
  gem.email         = ["mistydemeo@gmail.com"]
  gem.description   = %q{Simple CLI tool to access the Courex API}
  gem.summary       = %q{Simple CLI tool to access the Courex API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "courextool"
  gem.require_paths = ["lib"]
  gem.version       = Courex::VERSION

  gem.add_runtime_dependency "nokogiri"
  gem.add_runtime_dependency "slop"
end
