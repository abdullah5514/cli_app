# cli_app.rb
require 'thor'
require_relative 'modules/data'
require_relative 'modules/search'
require_relative 'modules/ui'

class CLIApp < Thor
  desc 'search QUERY', 'Search clients by name'
  def search(query)
    clients_data = Data.load_data('client.json')
    matching_clients = Search.search_clients(query, 'full_name', clients_data)

    if matching_clients.empty?
      puts "No clients found matching the search query."
    else
      puts "Matching clients:"
      UI.print_clients(matching_clients)
    end
  end

  desc 'duplicates', 'Find clients with duplicate emails'
  def duplicates
    clients_data = Data.load_data('client.json')
    duplicate_emails = Search.find_duplicate_emails(clients_data)
    UI.print_duplicate_clients(duplicate_emails, clients_data)
  end
end

CLIApp.start
