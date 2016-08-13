#!/usr/bin/env ruby
require 'estool/cat'
require 'thor'

module Estool
  class Cli < Thor
    register(Estool::Cat, 'cat', 'cat [SUBCOMMAND] [OPTIONS]', 'Utilize Elasticsearch API', )
  end
end