# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/notes/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-notes"
  spec.version       = Omniauth::Notes::VERSION
  spec.authors       = ["Andersen Fan"]
  spec.email         = ["as181920@hotmail.com"]
  spec.description   = %q{Omniauth strategies for Notes Platform}
  spec.summary       = %q{Omniauth strategies for Notes Platform}
  spec.homepage      = "http://notes18.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'multi_json'
end

