require 'active_support'
require 'elasticsearch-api'
require 'estool/connections'

module Estool::Actions
  class Cat

    def initialize(command,options)
      @cmd = command
      @data = options.except(:host, :port)
      @server = options.slice(:host, :port)
    end

    def self.format_options(data)
      params = {}
      data.each do |k, v|
        case k
          when 'verbose'
            params[:v] = v
          when 'output'
            params[:format] = v
          when 'timeout'
            params[:master_timeout] = v
          when 'name'
            params[:name] = v
          else
            puts 'does not exist'
        end
      end
    end

    def self.cat(action, options, server)
      client = Estool::Connections.start_conn(server[:host], server[:port])
      Estool::Connections.test_conn(client)
      begin
        puts client.cat.send(action, options)
      rescue ArgumentError => args
        puts "
             #{args}
        Usage: 'estool cat help #{action}' for more information
        "
        exit 1
      end
    end

    def self.run
      params = format_options(@data)
      puts params
      #cat(@cmd, params, @server)
    end
  end
end