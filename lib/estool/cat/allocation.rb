require 'estool/actions/cat'

module Estool
  class Cat::Allocation

    def initialize(options)
      @verbose = options[:verbose]
      @node = options[:node]
      @bytes = options[:bytes]
      @output = options[:output]
      @server = {
          host: options[:host],
          port: options[:port]
      }
    end

    def run
      data = {
          v: @verbose,
          node_id: @node,
          bytes: @bytes,
          format: @output
      }
      Estool::Actions::Cat.run(:allocation, data, @server)
    end
  end
end
