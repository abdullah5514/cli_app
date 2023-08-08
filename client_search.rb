#!/usr/bin/env ruby

require 'json'
require 'optparse'
require_relative 'modules/client_data'
require_relative 'modules/search'
require_relative 'modules/ui'

# Command-line utility to search and display client information.
class ClientSearch
  def initialize
    @options = {}
    @parser = OptionParser.new do |opts|
      opts.banner = "Usage: clients_search.rb [options]"

      # Parse the command line options
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

    # Parse the provided command line options
    @parser.parse!
  end

  # Run the client search application based on provided options.
  def run
    # Load client data from a JSON file
    clients_data = ClientData.load_data('client.json')

    if @options[:search]
      search_query = @options[:search]
      
      # Fetch clients matching the search query
      matching_clients = Search.fetch_clients(search_query, 'full_name', clients_data)

      if matching_clients.empty?
        puts "No clients found matching the search query."
      else
        puts "Matching clients:"
        UI.print_clients(matching_clients) # Display matching clients using UI module
      end
    end

    if @options[:duplicate]
      # Fetch emails with duplicate occurrences
      duplicate_emails = Search.fetch_duplicate_emails(clients_data)
      
      # Display clients with duplicate emails using UI module
      UI.print_duplicate_clients(duplicate_emails, clients_data)
    end
  end
end

# Create an instance of the ClientSearch class and run the application.
app = ClientSearch.new
app.run
