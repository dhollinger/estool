require 'elasticsearch-api'

def get_cat(arg,client)
  if arg != ''
    begin
      # Attempt to execute a Elasticsearch::API::Cat::CatClient function call
      puts client.cat.send("#{arg}", :v => true)
    rescue
      # Invalid function passed to Elasticsearch::API::Cat::CatClient
      puts 'Invalid Elasticsearch Cat option'
    end
  end
end