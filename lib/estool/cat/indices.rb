require 'lib/estool/actions/cat'

module Estool
  class Cat::Indices
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      data = {
          v: "#{@options[:verbose]}",
          bytes: "#{@options[:bytes]}",
          pri: "#{@options[:primary]}",
          format: "#{@options[:output]}"
      }
      data[:index] = @options[:index] unless @options[:index].nil?
      Estool::Actions::Cat.run(:indices, data, @options)
    end
  end
end