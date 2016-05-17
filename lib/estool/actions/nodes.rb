require 'elasticsearch-api'

module Estool
  module Nodes
    
    def self.get_hot_threads(client)
      client.nodes.hot_threads threads: 10
    end

    def self.get_info(client,info)
      client.nodes.info "#{info}": true
    end

    def self.get_stats(client,stat)
      client.nodes.stats "#{stat}": true
    end
    
    def self.get_nodes(client,option,*sub)
      case option
        when 'info'
          get_info(client,*sub)
        when 'stats'
          get_stats(client,*sub)
        when 'threads'
          get_hot_threads(client)
        else
          puts "invalid arugment"
      end
    end

  end
end