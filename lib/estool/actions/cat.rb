require 'elasticsearch-api'

module Estool
  module Cat
    def self.get_cat(arg, client)
      # Attempt to execute a Elasticsearch::API::Cat::CatClient function call
      puts client.cat.send("#{arg}", v: true)
    rescue NoMethodError => msg
      puts msg
      exit 1
    end
  end
end