require 'active_support'
require 'elasticsearch-api'
require 'estool/connections'

module Estool::Actions
  class Index

    def initialize(command, options)
      @cmd = command
      @data = options.except(:host, :port)
      @server = options.slice(:host, :port)
    end

    def format_options(data)
      param = {}
      data.each do |k, v|
        case k
          when 'update'
            params.merge!(update_all_types: v)
          when 'wait'
            params.merge!(wait_for_active_shards: v)
          else
            params.merge!("#{k}": v)
        end
      end
    end

    def index(action, options, server)
      client = Estool::Connections.start_conn(server[:host], server[:port])
      Estool::Connections.test_conn(client)
      begin
        puts client.index.send(action, options)
      rescue ArgumentError => args
          puts "
               #{args}
          Usage: 'estool index help #{action}' for more information
          "
          exit 1
      end
    end

    def run
      params = format_options(@data)
      index(@cmd, params, @server)
    end
  end
end