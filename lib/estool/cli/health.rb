require 'estool/actions/cat'

module Estool
  module Cli
    desc 'Get Cluster Health'
    command :health do |c|

      c.flag 'output', :default_value => 'text',
                       :arg_name => 'output_type',
                       :desc => 'Output Health status as text or json'

      c.action do |global_options,options,args|
        options = {
          host: global_options[:host],
          port: global_options[:port],
          verbose: global_options[:verbose],
          output: options[:output]
        }
        health = Estool::Actions::Cat.new('health', options)
        health.run
      end
    end
  end
end
