require 'lib/estool/actions/cat'

module Estool
  class Cat::Count

    def initialize(options)
      @verbose = options[:verbose]
      @output = options[:output]
      @timeout = options[:timeout]
      @index = options[:index]
      @server = {
          host: options[:host],
          port: options[:port]
      }
    end

    def run
      data = {
          v: @verbose,
          format: @output,
          master_timeout: @timeout,
          index: @index
      }
      Estool::Actions::Cat.run(:count, data, @server)
    end
  end
end