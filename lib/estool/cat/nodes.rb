require 'lib/estool/actions/cat'

module Estool
  class Cat::Nodes
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      data = {
          v: "#{@options[:verbose]}",
          format: "#{@options[:output]}"
      }
      Estool::Actions::Cat.run(:nodes, data, @options)
    end
  end
end