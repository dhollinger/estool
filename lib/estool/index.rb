require 'thor'
require 'estool/actions/index'

module Estool
  class Index < Thor
    class_option 'host', :type => :string,
                  :banner => 'Elasticsearch host to connect to',
                  :default => 'localhost',
                  :aliases => '-H'
    class_option 'port', :type => :string,
                  :banner => 'Port to use when connecting to Elasticsearch',
                  :default => '9200',
                  :aliases => '-p'
    class_option 'name', :type => :string,
                  :banner   => 'Index name',
                  :aliases  => '-n',
                  :required => true

    desc 'create [OPTIONS]', 'Create new index'
    method_option 'update', :type => :boolean,
                  :banner  => 'Update the mapping for all fields with the same name across all types.',
                  :default => false,
                  :aliases => '-u'
    method_option 'wait', :type => :numeric,
                  :banner  => 'Wait until specified number of shards is active.',
                  :default => 0,
                  :aliases => '-w'
    def create
      Estool::Actions::Index.new(:create, options).run
    end

    desc 'delete [OPTIONS]', 'Delete index'
    def delete
      Estool::Actions::Index.new(:delete, options).run
    end
  end
end