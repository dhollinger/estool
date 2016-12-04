#!/usr/bin/env ruby
require 'estool/cat'
require 'thor'

module Estool
  class Cli < Thor
    register(Estool::Cat, 'cat', 'cat [SUBCOMMAND] [OPTIONS]', 'Display health and status information about the cluster', )
    register(Estool::Index, 'index', 'index [SUBCOMMAND] [OPTIONS]', 'Manage cluster indices', )
  end
end