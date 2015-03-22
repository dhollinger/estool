#!/usr/bin/env ruby
require 'elasticsearch'
require 'net/http'

class Estool
  attr_reader :option, :server

  def initialize(option, server)
    @option = option
    @server = server
  end

end

class Connection

end