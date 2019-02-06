#!/usr/bin/env ruby
require 'eventmachine'
require 'em-http'
require 'fiber'
require 'json'

GITHUB_API_URL = 'https://api.github.com/user/repos'
OPTIONS = {
    :connect_timeout => 5,
    :inactivity_timeout => 10
}
def async_fetch(url)
  f = Fiber.current
  http = EventMachine::HttpRequest.new(url).get :timeout => 10
  http.callback { f.resume(http) }
  http.errback { f.resume(http) }

  return Fiber.yield
end

def async_create_github_repo(url,password,project_name)
  f = Fiber.current
  
  request = {
      :head => {
          'authorization' => ['wisehackermonkey',password.to_s]
      },
      :query => {
          :name => project_name
      }
  }
  puts JSON.dump(request)
  http = EventMachine::HttpRequest.new(url).post request
  http.callback { f.resume(http) }
  http.errback { f.resume(http) }

  return Fiber.yield
end


EventMachine.run do
  Fiber.new{

    print "Project name: "
    project_name = gets.chomp

    print "Password: "
    password = gets.chomp
    api = async_create_github_repo(GITHUB_API_URL,password,project_name)
    puts "#{api.response}"
        
    EventMachine.stop
  }.resume
end