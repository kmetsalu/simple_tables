# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_tables/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_tables"
  spec.version       = SimpleTables::VERSION
  spec.authors       = ["Kristjan Metsalu"]
  spec.email         = ["kristjan.metsalu@ut.ee"]
  spec.summary       = %q{ Simple gem that enables to create table and out of that PivotTable}
  spec.description   = %q{ Simple gem that enables to create table and out of that PivotTable to summarize data. }
  spec.homepage      = "https://github.com/kmetsalu/simple_tables"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
