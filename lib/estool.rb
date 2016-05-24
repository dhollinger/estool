#!/usr/bin/env ruby
require 'elasticsearch'
require 'net/http'
require 'optparse'
require 'lib/estool/connections'
require 'thor'

module Estool
  class Cli < Thor
    desc 'cat COMMAND [OPTIONS]', 'Utilize the Elasticsearch Cat API'
    method_option 'cmd', :type => :string,
                         :banner => 'Cat API subcommand. Required',
                         :option => :required
    method_option 'host', :type => :string,
                          :banner => 'Elasticsearch host to connect to. Default: localhost',
                          :default => 'localhost',
                          :aliases => '-H'
    method_option 'port', :type => :string,
                          :banner => 'Port to use when connecting to Elasticsearch. Default: 9200',
                          :default => '9200',
                          :aliases => '-p'
    method_option 'verbose', :type => :boolean,
                             :banner => 'Verbose option. Not all subcommands support it.',
                             :default => false,
                             :aliases => '-v'
    def cat(command)
      require 'lib/estool/cli/cat'
      Cat.new(command,options).run
    end

    desc 'nodes COMMAND [OPTIONS]', 'Utilize the Elasticsearch Nodes API'
    method_option 'cmd', :type => :string,
                         :banner => 'Nodes API subcommand. Required',
                         :option => :required
    method_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to. Default: localhost',
                  :default => 'localhost'
    method_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch. Default: 9200',
                  :default => '9200'
    def nodes(command)
      require 'lib/estool/cli/nodes'
      Nodes.new(command, options).run
    end
  end
end