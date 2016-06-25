require 'lib/estool/actions/cat'

module Estool
  class Cat::Nodeattrs

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
      Estool::Actions::Cat.run(:nodeattrs, data, @server)
    end

  end
end