#coding: utf-8
require File.expand_path('../lib/estool/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'estool'
  spec.version       = Estool::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['David Hollinger III']
  spec.email         = ['david.hollinger@moduletux.com']
  spec.summary       = %q{Command Line tool for interacting with Elasticsearch}
  spec.homepage      = %q{https://github.com/dhollinger/estool}
  spec.license       = 'Apache-2.0'

  # spec.files         = ['lib/estool.rb']
  spec.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  spec.executables   = ['estool']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency(%q<elasticsearch>, [">= 5.0.0", "< 6.0.0"])
  spec.add_runtime_dependency(%q<elasticsearch-api>, [">= 5.0.0", "< 6.0.0"])
  spec.add_runtime_dependency(%q<thor>)
end
