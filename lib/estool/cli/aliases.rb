require 'estool/actions/index'

module Estool
  module Cli
    desc 'Interact with Elasticsearch Index Aliases'
    command :aliases do |c|

      c.desc 'Get a list of aliases'
      c.long_desc %{
        Get a list of all aliases or a list of aliases for a specific index.
      }
      c.command [:list, :ls] do |ls|

        ls.flag 'name', :arg_name => 'alias name(s)',
                        :desc => 'Comma separated list of aliases to get information about'

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
    end
  end
end
