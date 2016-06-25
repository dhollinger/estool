require 'lib/estool/actions/cat'

module Estool
  class Cat::Health

    def initialize(options)
      @verbose = options[:verbose]
      @output = options[:output]
      @timeout = options[:timeout]
      @server = {
          host: options[:host],
          port: options[:port]
      }
    end

    def run
      data = {
          v: @verbose,
          format: @output,
          master_timeout: @timeout
      }
      Estool::Actions::Cat.run(:health, data, @server)
    end
  end
end