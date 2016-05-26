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
      help = '''
Usage: estool cat [COMMAND] [OPTIONS]

Subcommands:
 aliases allocation count fielddata health help indices
 master nodeattrs nodes pending_tasks plugins recovery
 repositories segments shards snapshots thread_pool
        '''
      client = Estool::Connections.start_conn(@options[:host],@options[:port])
      Estool::Connections.test_conn(client)
      # Attempt to execute a Elasticsearch::API::Cat::CatClient function call
      if @command == 'help'
        puts help
      elsif @options[:verbose] == true
        puts client.cat.send("#{@command}", v: true)
      else
        puts client.cat.send("#{@command}")
      end
    rescue NoMethodError
      puts "Invalid cat command: #{@command}"
      puts help
      exit 1
    rescue ArgumentError => arg
      puts """
      #{arg}
      Usage: 'estool cat help' for more information
      """
      exit 1
    end

  end
end