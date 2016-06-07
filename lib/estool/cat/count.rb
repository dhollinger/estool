require 'elasticsearch-api'
require 'lib/estool/connections'

module Estool
  class Cat::Count
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      client = Estool::Connections.start_conn(@options[:host], @options[:port])
      Estool::Connections.test_conn(client)
      begin
        puts client.cat.count v: "#{@options[:verbose]}",
                              format: "#{@options[:output]}",
                              master_timeout: "#{@options[:timeout]}",
                              index: "#{@options[:index]}"
      rescue ArgumentError => args
        puts "
        #{args}
        Usage: 'estool cat help aliases' for more information
        "
        exit 1
      end
    end
  end
end