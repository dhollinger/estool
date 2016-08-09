#coding: utf-8
$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'lib/estool/version'

Gem::Specification.new do |spec|
  spec.name          = 'estool'
  spec.version       = '0.0.5'
  spec.authors       = ['David Hollinger III']
  spec.email         = ['david.hollinger@moduletux.com']
  spec.summary       = %q{Command Line tool for interacting with Elasticsearch}
  spec.homepage      = %q{https://github.com/dhollinger/estool}
  spec.license       = 'Apache 2.0'

  spec.files         = ['bin/estool']
  spec.executables   = ['estool']
  spec.test_files    = ['tests/test_estool.rb']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency(%q<elasticsearch-api>, [">= 1.0.17", "< 2.0"])
  spec.add_runtime_dependency(%q<elasticsearch-transport>, [">= 1.0.17", "< 2.0"])
end
