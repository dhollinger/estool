require 'lib/estool/actions/cat'

module Estool
  class Cat::Count
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      data = {
          v: "#{@options[:verbose]}",
          format: "#{@options[:output]}",
          master_timeout: "#{@options[:timeout]}",
          index: "#{@options[:index]}"
      }
      Estool::Actions::Cat.run(:count, data, options)
    end
  end
end