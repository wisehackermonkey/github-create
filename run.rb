#!/usr/bin/env ruby
require 'eventmachine'
require 'em-http'
require 'fiber'
require 'json'

GITHUB_API_URL = 'https://api.github.com/zen'

def async_fetch(url)
  f = Fiber.current
  http = EventMachine::HttpRequest.new(url).get :timeout => 10
  http.callback { f.resume(http) }
  http.errback { f.resume(http) }

  return Fiber.yield
end

EventMachine.run do
  Fiber.new{
    puts "Setting up HTTP request #1"
    data = async_fetch(GITHUB_API_URL)
    puts "Fetched page #1: #{data.response_header.status}"
    puts "Response data # #{data.response}"
    EventMachine.stop
  }.resume
end