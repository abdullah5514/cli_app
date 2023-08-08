module UI
  # This module provides methods to display client data and related information.
  module_function
  
  # Print the details of a list of clients to the standard output.
  #
  # @param clients [Array] An array of client data objects to be displayed.
  def print_clients(clients)
    clients.each { |client| puts "#{client['full_name']} (#{client['email']})" }
  end

  # Print details of clients with duplicate emails along with their occurrence count.
  #
  # @param duplicate_emails [Hash] A hash with email addresses and their occurrence count.
  # @param clients_data [Array] An array of client data objects.
  def print_duplicate_clients(duplicate_emails, clients_data)
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
