require 'lib/estool/actions/cat'

module Estool
  class Cat::Recovery

    def initialize(options)
      @verbose = options[:verbose]
      @bytes = options[:bytes]
      @index = options[:index]
      @output = options[:output]
      @server = {
          host: options[:host],
          port: options[:port]
      }
    end

    def run
      data = {
          v: @verbose,
          format: @output,
      }
      data[:index] = @index unless @index.nil?
      data[:bytes] = @bytes unless @bytes.nil?
      Estool::Actions::Cat.run(:recovery, data, @server)
    end
  end
end