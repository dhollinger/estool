require 'thor'

module Estool
  class Cat < Thor
    desc 'aliases [OPTIONS]', 'Display information about aliases'
    method_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to',
                  :default => 'localhost',
                  :aliases => '-H'
    method_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch',
                  :default => '9200',
                  :aliases => '-p'
    method_option 'verbose', :type => :boolean,
                  :banner => 'Verbose option. Not all subcommands support it',
                  :default => false,
                  :aliases => '-v'
    method_option 'output', :type => :string,
                  :banner => 'Display output as json or text',
                  :default => 'text',
                  :aliases => '-o'
    method_option 'timeout', :type => :numeric,
                  :banner => 'Set Master Timeout in seconds',
                  :default => 30,
                  :aliases => '-t'
    method_option 'name', :type => :string,
                  :banner => 'Name of alias(es) to display information about',
                  :aliases => '-n'
    def aliases
      require 'lib/estool/cat/aliases'
      Aliases.new(options).run
    end

    desc 'allocation [OPTIONS]', 'Display shard allocation information'
    method_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to',
                  :default => 'localhost',
                  :aliases => '-H'
    method_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch',
                  :default => '9200',
                  :aliases => '-p'
    method_option 'verbose', :type => :boolean,
                  :banner => 'Verbose option. Not all subcommands support it',
                  :default => false,
                  :aliases => '-v'
    method_option 'output', :type => :string,
                  :banner => 'Display output as json or text',
                  :default => 'text',
                  :aliases => '-o'
    method_option 'timeout', :type => :numeric,
                  :banner => 'Set Master Timeout in seconds',
                  :default => 30,
                  :aliases => '-t'
    method_option 'bytes', :type => :string,
                  :banner => 'Unit to display byte values',
                  :default => 'b',
                  :enum => 'b k m g',
                  :aliases => '-b'
    method_option 'node', :type => :array,
                  :banner => 'Comma separated list of nodes',
                  :aliases => '-n'
    def allocation
      require 'lib/estool/cat/allocation'
      Allocation.new(options).run
    end

    desc 'health [OPTIONS]', 'Display Elasticsearch Cluster health'
    method_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to',
                  :default => 'localhost',
                  :aliases => '-H'
    method_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch',
                  :default => '9200',
                  :aliases => '-p'
    method_option 'verbose', :type => :boolean,
                  :banner => 'Verbose option. Not all subcommands support it',
                  :default => false,
                  :aliases => '-v'
    method_option 'output', :type => :string,
                  :banner => 'Display output as json or text',
                  :default => 'text',
                  :aliases => '-o'
    method_option 'timeout', :type => :numeric,
                  :banner => 'Set Master Timeout in seconds',
                  :default => 30,
                  :aliases => '-t'
    def health
      require 'lib/estool/cat/health'
      Health.new(options).run
    end

    desc 'nodes [OPTIONS]', 'Display Elasticsearch Nodes'
    method_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to',
                  :default => 'localhost',
                  :aliases => '-H'
    method_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch',
                  :default => '9200',
                  :aliases => '-p'
    method_option 'verbose', :type => :boolean,
                  :banner => 'Verbose option. Not all subcommands support it',
                  :default => false,
                  :aliases => '-v'
    method_option 'output', :type => :string,
                  :banner => 'Display output as json or text',
                  :default => 'text',
                  :aliases => '-o'
    method_option 'timeout', :type => :numeric,
                  :banner => 'Set Master Timeout in seconds',
                  :default => 30,
                  :aliases => '-t'
    def nodes
      require 'lib/estool/cat/nodes'
      Nodes.new(options).run
    end
  end
end