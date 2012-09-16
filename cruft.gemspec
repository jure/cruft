# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cruft/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jure Triglav"]
  gem.email         = ["me@juretriglav.si"]
  gem.description   = %q{Keeps a cruft.txt file in the app directory, which collects #cruft: notes from the app source code in a single place.}
  gem.summary       = %q{Cruft manager}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cruft"
  gem.require_paths = ["lib"]
  gem.version       = Cruft::VERSION
end
