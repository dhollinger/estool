#!/usr/bin/env ruby
require 'elasticsearch'
require 'net/http'
require 'optparse'
require 'lib/estool/cat'
require 'lib/estool/connections'
require 'thor'

module Estool
  class Cli < Thor
    register(Estool::Cat, 'cat', 'cat [SUBCOMMAND] [OPTIONS]', 'Utilize Elasticsearch API', )
  end
end