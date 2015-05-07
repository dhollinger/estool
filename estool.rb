#!/usr/bin/env ruby
require 'elasticsearch'
require 'net/http'
require 'optparse'
require 'ostruct'
require 'pp'

server = Elasticsearch::Client.new host: 'esr02sv02:9200'


class ElasticOptions
  def self.parse(args)
    options = OpenStruct.new
    options.cat = ''
    options.nodes = ''

    optparse = OptionParser.new do |opts|
      opts.banner = 'Usage estool.rb [options]'

      opts.on('-c', '--cat OPTION', 'Must pass a cat parameter') do |c|
        options.cat = c
      end

      opts.on_tail('-h', '--help', 'Display this screen') do
        puts opts
        exit
      end
    end
    optparse.parse!(args)
    options
  end
end

options = ElasticOptions.parse(ARGV)

if options.cat != ''
  begin
    puts server.cat.send("#{options.cat}", :v => true)
  rescue
    puts 'Invalid option'
  end
end