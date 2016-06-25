require 'thor'

module Estool
  class Cat < Thor
    class_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to',
                  :default => 'localhost',
                  :aliases => '-H'
    class_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch',
                  :default => '9200',
                  :aliases => '-p'
    class_option 'verbose', :type => :boolean,
                  :banner => 'Verbose option. Not all subcommands support it',
                  :default => false,
                  :aliases => '-v'
    class_option 'output', :type => :string,
                  :banner => 'Display output as json or text',
                  :default => 'text',
                  :aliases => '-o'
    class_option 'timeout', :type => :numeric,
                  :banner => 'Set Master Timeout in seconds',
                  :default => 30,
                  :aliases => '-t'

    desc 'aliases [OPTIONS]', 'Display information about aliases'
    method_option 'name', :type => :string,
                  :banner => 'Name of alias(es) to display information about',
                  :aliases => '-n'
    def aliases
      require 'lib/estool/cat/aliases'
      Aliases.new(options).run
    end

    desc 'allocation [OPTIONS]', 'Display shard allocation information'
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

    desc 'count [OPTIONS]', 'Return Document count for cluster or indices'
    method_option 'index', :type => :string,
                  :banner => 'Index to count documents',
                  :aliases => '-i'
    def count
      require 'lib/estool/cat/count'
      Count.new(options).run
    end

    desc 'fielddata [OPTIONS]', 'Return field data usage data'
    method_option 'fields', :type => :string,
                  :banner => 'Comma separated list of fields',
                  :aliases => '-f'
    method_option 'bytes', :type => :string,
                  :banner => 'Unit to display byte values in.',
                  :default => 'b',
                  :enum => 'b k m g',
                  :aliases => '-b'
    def fielddata
      require 'lib/estool/cat/fielddata'
      Fielddata.new(options).run
    end

    desc 'health [OPTIONS]', 'Display Elasticsearch Cluster health'
    def health
      require 'lib/estool/cat/health'
      Health.new(options).run
    end

    desc 'nodes [OPTIONS]', 'Display Elasticsearch Nodes'
    def nodes
      require 'lib/estool/cat/nodes'
      Nodes.new(options).run
    end
  end
end