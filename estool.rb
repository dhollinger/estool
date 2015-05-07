#!/usr/bin/env ruby
require 'elasticsearch'
require 'net/http'
require 'optparse'
require 'ostruct'
require 'pp'

server = Elasticsearch::Client.new host: 'elasticsrch1:9200'

class ElasticOptions
  def self.parse(args)
    options = OpenStruct.new
    options.cat = ""

    optparse = OptionParser.new do |opts|
      opts.banner = "Usage estool.rb [options]"
            opts.on('-c', '--cat OPTION', "Must pass a cat parameter") do |c|
        options.cat = c
      end

      opts.on_tail('-h', '--help', "Display this screen") do
        puts opts
        exit
      end
    end
    optparse.parse!(args)
    options
  end
end

options = ElasticOptions.new(ARGV)

pp options
pp ARGV

