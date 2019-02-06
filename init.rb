#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'

GITHUB_API_URL = 'https://api.github.com/zen'

uri = URI.parse(GITHUB_API_URL)

puts "Github project creator by Wisemonkey"
puts "-" * 44
puts

# create raw http post header

header = {'Content-Type': 'text/json'}
user = {user: {
        name: 'Bob',
        email: 'bob@example.com'
    }
}

# Create http objects
http = Net::HTTP.new(uri.host,uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = user.to_json

response = http.request(request)
puts response