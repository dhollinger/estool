require 'elasticsearch-api'
require 'estool/connections'

module Estool::Actions
  class Cat
    def self.run(action, data, options)
      client = Estool::Connections.start_conn(options[:host], options[:port])
      Estool::Connections.test_conn(client)
      begin
        puts client.cat.send(action, data)
      rescue ArgumentError => args
        puts "
             #{args}
        Usage: 'estool cat help #{action}' for more information
        "
        exit 1
      end
    end
  end
end