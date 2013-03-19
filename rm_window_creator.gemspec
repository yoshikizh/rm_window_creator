# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rm_window_creator/version'

Gem::Specification.new do |gem|
  gem.name          = "rm_window_creator"
  gem.version       = RmWindowCreator::VERSION
  gem.authors       = ["yoshikizh"]
  gem.email         = ["177365340@qq.com"]
  gem.description   = %q{TODO: window creator for rm}
  gem.summary       = %q{TODO: window creator for rm}
  gem.homepage      = "https://github.com/yoshikizh/rm_window_creator.git"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "bundler", ">= 1.0.0" 

end
