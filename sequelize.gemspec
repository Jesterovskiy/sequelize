# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sequelize/version'

Gem::Specification.new do |spec|
  spec.name          = 'sequelize'
  spec.version       = Sequelize::VERSION
  spec.authors       = ['Andrey Savchenko']
  spec.email         = ['andrey@aejis.eu']
  spec.summary       = 'Add missing Sequel parts to your application'
  spec.description   = 'Add missing Sequel parts to your application'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sequel', '~> 5.5.0'
  spec.add_dependency 'thor', '~> 0.20.0'
  spec.add_dependency 'adamantium', '~> 0.2.0'
  spec.add_dependency 'sequoia', '~> 0.2.0'

  spec.add_development_dependency 'bundler', '~> 1.16.1'
  spec.add_development_dependency 'rake', '~> 12.3.0'
end
