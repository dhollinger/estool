require 'estool/actions/index'

module Estool
  module Cli
    desc 'Interact with Elasticsearch Index Aliases'
    command :aliases do |c|

      c.desc 'Get a list of aliases'
      c.command [:list, :ls] do |ls|

        ls.flag [:index, :i], :arg_name => 'index name(s)',
                              :desc => 'Comma separated list of index names'

        ls.action do |global_options,options,args|
          options = {
            host: global_options[:host],
            port: global_options[:port],
            name: options[:name],
            index: options[:index]
          }
          ls_alias = Estool::Actions::Index.new('get_aliases', options)
          ls_alias.run
        end
      end

      c.desc 'create an alias for an index.'
      c.command [:create, :c] do |create|
        create.flag [:name, :n], :arg_name => 'alias name',
                                 :required => true,
                                 :desc     => 'What to name the alias.'

        create.flag [:index, :i], :arg_name => 'index name',
                                  :required => true,
                                  :desc     => 'Index to apply alias to.'

        create.action do |global_options,options,args|
          options = {
            host: global_options[:host],
            port: global_options[:port],
            name: options[:name],
            index: options[:index]
          }
          cr_alias = Estool::Actions::Index.new('put_alias', options)
          cr_alias.run
        end
      end

      c.desc 'delete an alias for an index.'
      c.command [:delete, :d] do |delete|
        delete.flag [:name, :n], :arg_name => 'alias name',
                                 :required => true,
                                 :desc     => 'Which alias to delete.'

        delete.flag [:index, :i], :arg_name => 'index name',
                                  :required => true,
                                  :desc     => 'Index to apply alias to.'

        delete.action do |global_options,options,args|
          options = {
            host: global_options[:host],
            port: global_options[:port],
            name: options[:name],
            index: options[:index]
          }
          dl_alias = Estool::Actions::Index.new('delete_alias', options)
          dl_alias.run
        end
      end

      c.default_command :list
    end
  end
end
