require 'thor'
require 'estool/actions/cat'

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
    # class_option 'timeout', :type => :numeric,
    #               :banner => 'Set Master Timeout in seconds',
    #               :default => 30,
    #               :aliases => '-t'

    desc 'aliases [OPTIONS]', 'Display information about aliases'
    method_option 'name', :type => :string,
                  :banner => 'Name of alias(es) to display information about',
                  :aliases => '-n'
    def aliases
      Estool::Actions::Cat.new(:aliases, options).run
    end

    desc 'allocation [OPTIONS]', 'Display shard allocation information'
    method_option 'node', :type => :array,
                  :banner => 'Comma separated list of nodes',
                  :aliases => '-n'
    method_option 'bytes', :type => :string,
                 :banner => 'Unit to display byte values in.',
                 :default => 'b',
                 :enum => %w{b k m g},
                 :aliases => '-b'
    def allocation
      Estool::Actions::Cat.new(:allocation, options).run
    end

    desc 'count [OPTIONS]', 'Return Document count for cluster or indices'
    method_option 'index', :type => :string,
                  :banner => 'Index to count documents',
                  :aliases => '-i'
    def count
      Estool::Actions::Cat.new(:count, options).run
    end

    desc 'fielddata [OPTIONS]', 'Return field data usage data'
    method_option 'fields', :type => :string,
                  :banner => 'Comma separated list of fields',
                  :aliases => '-f'
    method_option 'bytes', :type => :string,
                  :banner => 'Unit to display byte values in.',
                  :default => 'b',
                  :enum => %w{b k m g},
                  :aliases => '-b'
    def fielddata
      Estool::Actions::Cat.new(:fielddata, options).run
    end

    desc 'health [OPTIONS]', 'Display Elasticsearch Cluster health'
    def health
      Estool::Actions::Cat.new(:health, options).run
    end

    desc 'indices [OPTIONS]', 'Display indices statistics across the cluster'
    method_option 'index', :type => :string,
                  :banner => 'Comma separated list of index names to display',
                  :aliases => '-i'
    method_option 'primary', :type => :boolean,
                  :banner => 'Limit returned information to primary shards only',
                  :aliases => '-P',
                  :default => false
    method_option 'bytes', :type => :string,
                  :banner => 'Unit to display byte values in.',
                  :default => 'b',
                  :enum => %w{b k m g},
                  :aliases => '-b'
    def indices
      Estool::Actions::Cat.new(:indices, options).run
    end

    desc 'master [OPTIONS]', 'Display current master node'
    def master
      Estool::Actions::Cat.new(:master, options).run
    end

    desc 'nodeattrs [OPTIONS]', 'Display custom node attributes'
    def nodeattrs
      Estool::Actions::Cat.new(:nodeattrs, options).run
    end

    desc 'nodes [OPTIONS]', 'Display Elasticsearch Nodes'
    def nodes
      Estool::Actions::Cat.new(:nodes, options).run
    end

    desc 'ptasks [OPTIONS]', 'Display Elasticsearch Pending Task in tabular format'
    def ptasks
      Estool::Actions::Cat.new(:pending_tasks, options).run
    end

    desc 'plugins [OPTIONS]', 'Display Elasticsearch Plugins'
    def plugins
      Estool::Actions::Cat.new(:plugins, options).run
    end

    desc 'recovery [OPTIONS]', 'Display shard recovery status'
    method_option 'index', :type => :string,
                  :banner => 'List of indexes to return information about. Comma-separated',
                  :aliases => '-i'
    method_option 'bytes', :type => :string,
                  :banner => 'Unit to display byte values in.',
                  :default => 'b',
                  :enum => %w{b k m g},
                  :aliases => '-b'
    def recovery
      Estool::Actions::Cat.new(:recovery, options).run
    end

    desc 'repositories [OPTIONS]', 'Display registered repositories'
    def repositories
      Estool::Actions::Cat.new(:repositories, options).run
    end
  end
end