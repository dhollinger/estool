#coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'estool'
  spec.version       = '0.5'
  spec.authors       = ['David Hollinger III']
  spec.email         = ['david.hollinger@moduletux.com']
  spec.summary       = %q{Command Line tool for interacting with Elasticsearch}
  spec.homepage      = %q{https://github.com/dhollinger/estool}
  spec.license       = 'Apache 2.0'

  spec.files         = ['lib/estool.rb']
  spec.executables   = ['bin/estool']
  spec.test_files    = ['tests/test_estool.rb']
  spec.require_paths = ['lib']
end
