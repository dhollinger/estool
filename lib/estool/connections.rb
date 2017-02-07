require 'elasticsearch'
require 'net/http'

module Estool
  module Connections
    def self.start_conn(host, port)
      Elasticsearch::Client.new host: "#{host}:#{port}"
    end

    def self.test_conn(client)
      client.perform_request 'GET', '_cluster/health'
    rescue Faraday::ConnectionFailed => connfail
      # Connection Failure Message
      puts connfail
      exit 1
    end
  end
end
