require 'lib/estool/actions/cat'

module Estool
  class Cat::Indices

    def initialize(options)
      @verbose = options[:verbose]
      @bytes = options[:bytes]
      @primary = options[:primary]
      @output = options[:output]
      @index = options[:index]
      @server = {
          host: options[:host],
          port: options[:port]
      }
    end

    def run
      data = {
          v: @verbose,
          bytes: @bytes,
          pri: @primary,
          format: @output
      }
      data[:index] = @index unless @index.nil?
      Estool::Actions::Cat.run(:indices, data, @server)
    end
  end
end