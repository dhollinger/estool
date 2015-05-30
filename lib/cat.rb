require 'elasticsearch-api'

def get_cat(arg,client)
  if arg != ''
    begin
      # Attempt to execute a Elasticsearch::API::Cat::CatClient function call
      puts client.cat.send("#{arg}", :v => true)
    rescue NoMethodError => msg
      puts msg
      exit 1
    end
  end
end