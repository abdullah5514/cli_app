# modules/ui.rb
module UI
    def self.print_clients(clients)
      clients.each { |client| puts "#{client['full_name']} (#{client['email']})" }
    end
  
    def self.print_duplicate_clients(duplicate_emails, clients_data)
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
  