# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'learneroo_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "learneroo_gem"
  spec.version       = LearnerooGem::VERSION
  spec.authors       = ["Ariel Krakowski"]
  spec.email         = ["arikrak@gmail.com"]
  spec.description   = %q{Prints out names of tests}
  spec.summary       = %q{Medium-level output between default and verbose}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
