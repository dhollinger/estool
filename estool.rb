#!/usr/bin/env ruby
require 'elasticsearch'
require 'net/http'
require 'optparse'
require 'ostruct'

options = {
  :cat    => '',
  :server => 'localhost',
  :port   => '9200'
}

OptionParser.new do |opts|
  # Option Banner Shown with the help option
  opts.banner = 'Usage estool.rb [options]'

  # Elasticsearch Cat API Option
  opts.on('-c', '--cat OPTION', 'Utilize the Cat API') do |c|
    options[:cat] = c
  end

  # Set Server to connect to. Defaults to localhost.
  opts.on('-s', '--server OPTION', 'Specify Node to connect to') do |s|
    options[:server] = s
  end

  # Set Elasticsearch HTTP port. Defaults to 9200
  opts.on('-p', '--port OPTION', 'Specify HTTP port') do |p|
    options[:port] = p
  end

  # Displays the Help Screen
  opts.on_tail('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end.parse!

server = Elasticsearch::Client.new host: "#{options[:server]}:#{options[:port]}"

# Check if the Cat option is empty.
if options[:cat] != ''
  begin
    # Attempt to execute a Elasticsearch::API::Cat::CatClient function call
    puts server.cat.send("#{options[:cat]}", :v => true)
  rescue
    # Invalid function passed to Elasticsearch::API::Cat::CatClient
    puts 'Invalid Elasticsearch Cat option'
  end
end