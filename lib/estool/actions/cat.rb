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

    def format_options(data)
      params = {}
      puts @data
      data.each do |k, v|
        case k
        when :verbose
            params.merge!(v: v)
          when :output
            params.merge!(format: v)
          when :name
            params.merge!(name: v)
          when :node
            params.merge!(node_id: v)
          when :primary
            params.merge!(pri: v)
          else
            params.merge!("#{k}": v)
        end
      end
      return params
    end

    def cat(action, options, server)
      client = Estool::Connections.start_conn(server[:host], server[:port])
      Estool::Connections.test_conn(client)
      begin
        puts client.cat.send(action, options)
      rescue ArgumentError => args
        puts "
             #{args}
        Usage: 'estool help #{action}' for more information
        "
        exit 1
      end
    end

    def run
      params = format_options(@data)
      cat(@cmd, params, @server)
    end
  end
end
