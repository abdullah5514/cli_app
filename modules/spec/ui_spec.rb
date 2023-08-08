# spec/ui_spec.rb
require_relative '../modules/ui'

describe UI do
  describe '.print_clients' do
    it 'prints client names and emails' do
      clients = [
        { 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' }
      ]

      expect { UI.print_clients(clients) }.to output(
        "John Doe (john@example.com)\nJane Smith (jane@example.com)\n"
      ).to_stdout
    end
  end

  describe '.print_duplicate_clients' do
    it 'prints clients with duplicate emails' do
      clients_data = [
        { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' },
        { 'id' => 3, 'full_name' => 'Another Jane Smith', 'email' => 'jane@example.com' }
      ]
      duplicate_emails = { 'jane@example.com' => 2 }

      expected_output = <<~OUTPUT
        Clients with duplicate emails:
        Email: jane@example.com (Count: 2)
          - Jane Smith (ID: 2)
          - Another Jane Smith (ID: 3)
      OUTPUT

      expect { UI.print_duplicate_clients(duplicate_emails, clients_data) }.to output(expected_output).to_stdout
    end

    it 'prints message for no duplicate emails' do
      duplicate_emails = {}

      expect { UI.print_duplicate_clients(duplicate_emails, []) }.to output("No clients with duplicate emails found.\n").to_stdout
    end
  end
end
