require 'rspec'
require_relative '../../modules/ui'

describe UI do
  describe '.print_clients' do
    it 'prints clients with their names and emails' do
      # Sample client data
      clients = [
        { 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' }
      ]
      
      # Expected output when printing clients
      expected_output = "John Doe (john@example.com)\nJane Smith (jane@example.com)\n"
      
      # Compare the captured output with the expected output
      expect { UI.print_clients(clients) }.to output(expected_output).to_stdout
    end
  end

  describe '.print_duplicate_clients' do
    context 'when duplicate emails exist' do
      it 'prints clients with duplicate emails along with their details' do
        # Sample duplicate email data and clients data
        duplicate_emails = { 'jane@example.com' => 2 }
        clients_data = [
          { 'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' },
          { 'id' => 15, 'full_name' => 'Another Jane Smith', 'email' => 'jane@example.com' }
        ]
        
        # Expected output when printing clients with duplicate emails
        expected_output = <<~OUTPUT
          Clients with duplicate emails:
          Email: jane@example.com (Count: 2)
            - Jane Smith (ID: 2)
            - Another Jane Smith (ID: 15)
        OUTPUT
        
        # Compare the captured output with the expected output
        expect { UI.print_duplicate_clients(duplicate_emails, clients_data) }.to output(expected_output).to_stdout
      end
    end

    context 'when no duplicate emails exist' do
      it 'prints a message about no duplicate emails found' do
        # Sample empty duplicate email data and clients data
        duplicate_emails = {}
        clients_data = []
        
        # Expected output when no duplicate emails are found
        expected_output = "No clients with duplicate emails found.\n"
        
        # Compare the captured output with the expected output
        expect { UI.print_duplicate_clients(duplicate_emails, clients_data) }.to output(expected_output).to_stdout
      end
    end
  end
end
