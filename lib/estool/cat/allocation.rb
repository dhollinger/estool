require 'elasticsearch-api'
require 'lib/estool/connections'

module Estool
  class Cat::Allocation
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      client = Estool::Connections.start_conn(@options[:host], @options[:port])
      Estool::Connections.test_conn(client)
      begin
        puts client.cat.allocation v: "#{@options[:verbose]}",
                 node_id: "#{@options[:node]}",
                 bytes: "#{@options[:bytes]}",
                 format: "#{@options[:output]}"
      rescue ArgumentError => args
        puts """
        #{args}
        Usage: 'estool cat help allocation' for more information
        """
        exit 1
      end
    end
  end
end
