#!/usr/bin/env ruby
require 'elasticsearch'
require 'net/http'
require 'optparse'
require 'ostruct'
require 'pp'

# Create Connection to Elasticsearch Nodes
# Eventually will be an option that defaults to localhost
server = Elasticsearch::Client.new host: 'es_node:9200'


class ElasticOptions
  def self.parse(args)
    # Creates an OpenStruct Object to store the options in
    options = OpenStruct.new
    options.cat = ''

    optparse = OptionParser.new do |opts|
      # Option Banner Shown with the help option
      opts.banner = 'Usage estool.rb [options]'

      # Elasticsearch Cat API Option
      opts.on('-c', '--cat OPTION', 'Must pass a cat parameter') do |c|
        options.cat = c
      end

      # Displays the Help Screen
      opts.on_tail('-h', '--help', 'Display this screen') do
        puts opts
        exit
      end
    end
    # Parse the optparse variable and return options
    optparse.parse!(args)
    options
  end
end

# Pass an argument to ElasticOptions class. Results stored in options variable
options = ElasticOptions.parse(ARGV)

# Check if the Cat option is empty.
if options.cat != ''
  begin
    # Attempt to execute a Elasticsearch::API::Cat::CatClient function call
    puts server.cat.send("#{options.cat}", :v => true)
  rescue
    # Invalid function passed to Elasticsearch::API::Cat::CatClient
    puts 'Invalid Elasticsearch Cat option'
  end
end