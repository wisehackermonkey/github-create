#!/usr/bin/env ruby
# Github repository creator

# Creates a new repository on github.com
# asks for project name => repository name
# asks for username and password of github account
# generates a repository based on the name and description

# wisemonkey
# oranbusiness@gmail.com
# 20190206
# github.com/wisehackermonkey

require 'github_api'

# helper module for no echoing password input
require_relative 'lib/helper.rb'
include Helper
begin
  puts "Github project creator by Wisemonkey"
  puts "-" * 44
  puts

  print "Project Name: "
  project_name = gets.chomp

  print "Description: "
  description = gets.chomp

  print "Github Username: "
  username = gets.chomp

  print "Github Password: "
  password = Helper::hide_password
  puts

  begin
    # authenticate github api
    github = Github.new basic_auth: "#{username}:#{password}"

    # create repo given project name
    # docs for "create repo"
    # https://www.rubydoc.info/github/piotrmurach/github/master/Github/Client/Repos:create
    github.repos.create "name": "#{project_name}",
                        "description": "#{description}"

    # check if repo was created
    repo_created = github.repos.find "#{username}", "#{project_name}"
    unless repo_created.success?
      raise "repo not found or an error occured"
    end

    puts "Successfully created Repo #{project_name}"
      # puts "https://www.github.com/#{username}/#{project_name}"
  rescue Github::Error::GithubError => e

    # handle if repo was not found
    if e.is_a? Github::Error::NotFound
      puts "-" * 44
      puts "Error: Created repository not found"
      puts "-" * 44
    end

    # Handles incorrect username or password login
    if e.is_a? Github::Error::Unauthorized
      puts "-" * 44
      puts "Error: username or password is incorrect"
      puts "-" * 44
    end

    # Handels if repository already exists
    if e.is_a? Github::Error::UnprocessableEntity
      puts "-" * 44
      puts "Error: Repository already exists, try another project name"
      puts "-" * 44
    end

    puts
    puts "Error message"
    puts e.message
    puts "-" * 44

  end

rescue Interrupt => e
  puts
  puts "-" * 44
  puts "Exiting.... #{e.message}"
  puts "-" * 44
end
