require 'lib/estool/actions/cat'

module Estool
  class Cat::Nodes

    def initialize(options)
      @verbose = options[:verbose]
      @output = options[:output]
      @server = {
          host: options[:host],
          port: options[:port]
      }
    end

    def run
      data = {
          v: @verbose,
          format: @output
      }
      Estool::Actions::Cat.run(:nodes, data, @server)
    end
  end
end