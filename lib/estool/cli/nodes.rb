require 'elasticsearch-api'
require 'lib/estool/connections'

module Estool
  class Cli::Nodes
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      client = Estool::Connections.start_conn(@options[:host],@options[:port])
      Estool::Connections.test_conn(client)
      client.nodes.send("#{@options[:cmd]}")
    end

  end
end