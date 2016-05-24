require 'elasticsearch-api'
require 'lib/estool/connections'

module Estool
  class Cli::Cat
    attr_reader :command, :options

    def initialize(command, options)
      @command = command
      @options = options
    end

    def run
      client = Estool::Connections.start_conn(@options[:host],@options[:port])
      Estool::Connections.test_conn(client)
      # Attempt to execute a Elasticsearch::API::Cat::CatClient function call
      if @options[:verbose] == true
        puts client.cat.send("#{@command}", master_timeout: 30, v: true)
      else
        puts client.cat.send("#{@command}", master_timeout: 30)
      end
    rescue NoMethodError
      puts "Unsupported command: #{@command}"
      exit 1
    rescue ArgumentError => arg
      puts arg
      exit 1
    end

  end
end