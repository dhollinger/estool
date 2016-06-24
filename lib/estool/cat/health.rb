require 'lib/estool/actions/cat'

module Estool
  class Cat::Health
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      data = {
          v: "#{@options[:verbose]}",
          format: "#{@options[:output]}",
          master_timeout: "#{@options[:timeout]}"
      }
      Estool::Actions::Cat.run(:health, data, @options)
    end
  end
end