require 'lib/estool/actions/cat'

module Estool
  class Cat::Allocation
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      data = {
          v: "#{@options[:verbose]}",
          node_id: "#{@options[:node]}",
          bytes: "#{@options[:bytes]}",
          format: "#{@options[:output]}"
      }
      Estool::Actions::Cat.run(:allocation, data, @options)
    end
  end
end
