require 'elasticsearch'
require 'net/http'

module Connections
  def start_conn(host,port)
    Elasticsearch.client.new host: "#{host}:#{port}"
  end


end