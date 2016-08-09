require 'estool/actions/cat'

module Estool
  class Cat::Fielddata

    def initialize(options)
      @verbose = options[:verbose]
      @timeout = options[:timeout]
      @bytes = options[:bytes]
      @fields = options[:fields]
      @server = {
          host: options[:host],
          port: options[:port]
      }
    end

    def run
      data = {
          v: @verbose,
          master_timeout: @timeout,
          bytes: @bytes
      }
      data[:fields] = @fields unless @fields.nil?
      Estool::Actions::Cat.run(:fielddata, data, @server)
    end
  end
end