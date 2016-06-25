require 'lib/estool/actions/cat'

module Estool
  class Cat::Aliases

    def initialize(options)
      @verbose = options[:verbose]
      @output = options[:output]
      @timeout = options[:timeout]
      @name = options[:name]
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
          name: @name
      }
      Estool::Actions::Cat.run(:aliases, data, @server)
    end
  end
end