require 'estool/actions/cat'
require 'estool/actions/index'

module Estool
  module Cli
    desc 'Interact with Cluster Indices'
    arg_name 'subcommand'
    command :index do |c|

      c.desc 'Create a new index'
      c.command :create do |create|
        create.flag 'name', :required => true,
                            :arg_name => 'index_name',
                            :desc => 'Name of the index to create'

        create.flag 'update', :default_value => false,
                              :desc => 'Update the mapping for all fields with
                                        same name across all types.'

        create.flag 'wait', :default_value => 0,
                            :desc => 'Wait until specified number of shards is active'

        create.action do |global_options,options,args|
          options = {
            host: global_options[:host],
            port: global_options[:port],
            index: options[:name],
            update: options[:update],
            wait: options[:wait]
          }
          create = Estool::Actions::Index.new('create', options)
          create.run
        end
      end

      c.desc 'Delete Index or Indices'
      c.command :delete do |delete|
        delete.flag 'name', :required => true,
                            :arg_name => 'index_name',
                            :desc => 'Name of the index to delete'


        delete.action do |global_options,options,args|
          options = {
            host: global_options[:host],
            port: global_options[:port],
            name: options[:name]
          }
          delete = Estool::Actions::Index.new('delete', options)
          delete.run
        end
      end

      c.desc 'List indices'
      c.command :show do |show|
        show.action do |global_options,options,args|
          options = {
            host: global_options[:host],
            port: global_options[:port],
            verbose: global_options[:verbose]
          }
          show = Estool::Actions::Cat.new('indices', options)
          show.run
        end
      end

      c.desc 'Close index'
      c.command :close do |close|
        close.switch 'ignore_unavailable', :default_value => false,
                                           :desc => 'Ignore indices if unavailable.',
                                           :negatable => false

        close.flag 'name', :required => true,
                           :arg_name => 'index_name',
                           :desc => 'name of index to close'

        close.action do |global_options,options,args|
          options = {
            host: global_options[:host],
            port: global_options[:port],
            ignore_unavailable: options[:ignore_unavailable],
            name: options[:name]
          }
          close = Estool::Actions::Index.new('close', options)
          close.run
        end
      end

      c.default_command :show
    end
  end
end
