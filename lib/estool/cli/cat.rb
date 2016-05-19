require 'elasticsearch-api'
require 'lib/estool/connections'

module Estool
  class Cli::Cat
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      client = Estool::Connections.start_conn(@options[:host],@options[:port])
      Estool::Connections.test_conn(client)
      # Attempt to execute a Elasticsearch::API::Cat::CatClient function call
      puts client.cat.send("#{@options[:cmd]}", v: true)
    rescue NoMethodError => msg
      puts msg
      exit 1
    end

  end
end