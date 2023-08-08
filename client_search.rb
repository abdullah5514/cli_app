#!/usr/bin/env ruby

require 'json'
require 'optparse'
require_relative 'modules/data'
require_relative 'modules/search'
require_relative 'modules/ui'

class ClientSearch
  def initialize
    @options = {}
    @parser = OptionParser.new do |opts|
      opts.banner = "Usage: clients.rb [options]"

      opts.on("--search QUERY", "Search clients by name") do |query|
        @options[:search] = query
      end

      opts.on("--duplicate", "Find clients with duplicate emails") do
        @options[:duplicate] = true
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end

    @parser.parse!
  end

  def run
    clients_data = Data.load_data('client.json')

    if @options[:search]
      search_query = @options[:search]
      matching_clients = Search.fetch_clients(search_query, 'full_name', clients_data)

      if matching_clients.empty?
        puts "No clients found matching the search query."
      else
        puts "Matching clients:"
        UI.print_clients(matching_clients)
      end
    end

    if @options[:duplicate]
      duplicate_emails = Search.fetch_duplicate_emails(clients_data)
      UI.print_duplicate_clients(duplicate_emails, clients_data)
    end
  end
end

app = ClientSearch.new
app.run
