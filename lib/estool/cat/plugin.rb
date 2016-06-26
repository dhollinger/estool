require 'lib/estool/actions/cat'

module Estool
  class Cat::Plugin

    def initialize(options)
      @verbose = options[:verbose]
      @server = {
          host: options[:host],
          port: options[:port]
      }
    end

    def run
      data = {
          v: @verbose
      }
      Estool::Actions::Cat.run(:plugins, data, @server)
    end
  end
end