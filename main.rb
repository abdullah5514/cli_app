# cli_app.rb
require 'json'
require 'thor'

class CLIApp < Thor
  desc 'search QUERY', 'Search clients by name'
  def search(query)
    clients_data = JSON.parse(File.read('client.json'))
    matching_clients = clients_data.select { |client| client['full_name'].downcase.include?(query.downcase) }

    if matching_clients.empty?
      puts "No clients found matching the search query."
    else
      puts "Matching clients:"
      matching_clients.each do |client|
        puts "#{client['full_name']} (#{client['email']})"
      end
    end
  end

  desc 'duplicates', 'Find clients with duplicate emails'
  def duplicates
    clients_data = JSON.parse(File.read('client.json'))
    email_counts = Hash.new(0)

    clients_data.each do |client|
      email_counts[client['email']] += 1
    end

    duplicate_emails = email_counts.select { |_, count| count > 1 }

    if duplicate_emails.empty?
      puts "No clients with duplicate emails found."
    else
      puts "Clients with duplicate emails:"
      duplicate_emails.each do |email, count|
        duplicate_clients = clients_data.select { |client| client['email'] == email }
        puts "Email: #{email} (Count: #{count})"
        duplicate_clients.each do |client|
          puts "  - #{client['full_name']} (ID: #{client['id']})"
        end
      end
    end
  end
end

CLIApp.start
