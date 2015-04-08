#!/usr/bin/env ruby
require 'elasticsearch'
require 'net/http'

class Server
  attr_reader :server

  def initialize(server)
    @server = server
  end

end

class Connection < Server

end
