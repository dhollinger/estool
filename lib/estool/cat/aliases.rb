require 'lib/estool/actions/cat'

module Estool
  class Cat::Aliases
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      data = {
          v: "#{@options[:verbose]}",
          format: "#{@options[:output]}",
          master_timeout: "#{@options[:timeout]}",
          name: "#{@options[:name]}"
      }
      Estool::Actions::Cat.run(:aliases, data, @options)
    end
  end
end