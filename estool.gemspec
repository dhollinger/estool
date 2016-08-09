#coding: utf-8
$:.unshift File.dirname(__FILE__)
require 'lib/estool/version'

Gem::Specification.new do |spec|
  spec.name          = 'estool'
  spec.version       = '0.0.5'
  spec.authors       = ['David Hollinger III']
  spec.email         = ['david.hollinger@moduletux.com']
  spec.summary       = %q{Command Line tool for interacting with Elasticsearch}
  spec.homepage      = %q{https://github.com/dhollinger/estool}
  spec.license       = 'Apache 2.0'

  spec.files         = ['lib/estool.rb']
  spec.executables   = ['estool']
  spec.test_files    = ['tests/test_estool.rb']
  spec.require_paths = ['lib']
end
