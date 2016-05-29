require 'elasticsearch-api'
require 'lib/estool/connections'

module Estool
  class Cat::Health
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      client = Estool::Connections.start_conn(@options[:host],@options[:port])
      Estool::Connections.test_conn(client)
      begin
        puts client.cat.health v: "#{@options[:verbose]}",
                 format: "#{@options[:output]}",
                 master_timeout: "#{@options[:timeout]}"
      rescue ArgumentError => args
        puts """
        #{arg}
        Usage: 'estool cat help' for more information
        """
        exit 1
      end
    end
  end
end