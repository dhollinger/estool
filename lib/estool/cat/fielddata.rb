require 'lib/estool/actions/cat'

module Estool
  class Cat::Fielddata
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      data = {
          v: "#{@options[:verbose]}",
          master_timeout: "#{@options[:timeout]}",
          bytes: "#{@options[:bytes]}"
      }
      data[:fields] = @options[:fields] unless @options[:fields].nil?
      Estool::Actions::Cat.run(:fielddata, data, @options)
    end
  end
end