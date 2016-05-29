require 'thor'

module Estool
  class Cat < Thor
    desc 'health [OPTIONS]', 'Display Elasticsearch Cluster health'
    method_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to. Default: localhost',
                  :default => 'localhost',
                  :aliases => '-H'
    method_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch. Default: 9200',
                  :default => '9200',
                  :aliases => '-p'
    method_option 'verbose', :type => :boolean,
                  :banner => 'Verbose option. Not all subcommands support it',
                  :default => false,
                  :aliases => '-v'
    method_option 'output', :type => :string,
                  :banner => 'Display output as json or text. Default: text',
                  :default => 'text',
                  :aliases => '-o'
    method_option 'timeout', :type => :numeric,
                  :banner => 'Set Master Timeout in seconds. Default: 30',
                  :default => 30,
                  :aliases => '-t'
    def health
      require 'lib/estool/cat/health'
      Health.new(options).run
    end

    desc 'nodes [OPTIONS]', 'Display Elasticsearch Nodes'
    method_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to. Default: localhost',
                  :default => 'localhost',
                  :aliases => '-H'
    method_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch. Default: 9200',
                  :default => '9200',
                  :aliases => '-p'
    method_option 'verbose', :type => :boolean,
                  :banner => 'Verbose option. Not all subcommands support it',
                  :default => false,
                  :aliases => '-v'
    method_option 'output', :type => :string,
                  :banner => 'Display output as json or text. Default: text',
                  :default => 'text',
                  :aliases => '-o'
    method_option 'timeout', :type => :numeric,
                  :banner => 'Set Master Timeout in seconds. Default: 30',
                  :default => 30,
                  :aliases => '-t'
    def nodes
      require 'lib/estool/cat/nodes'
      Nodes.new(options).run
    end
  end
end