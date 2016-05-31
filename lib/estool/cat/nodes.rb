require 'elasticsearch-api'
require 'lib/estool/connections'

module Estool
  class Cat::Nodes
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      client = Estool::Connections.start_conn(@options[:host],@options[:port])
      Estool::Connections.test_conn(client)
      begin
        puts client.cat.nodes v: "#{@options[:verbose]}",
                              format: "#{@options[:output]}"
      rescue ArgumentError => args
        puts """
        #{args}
        Usage: 'estool cat help nodes' for more information
        """
        exit 1
      end
    end
  end
end