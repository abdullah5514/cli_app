require 'rspec'
require_relative '../../modules/search'

describe Search do
  describe '.fetch_clients' do
    let(:clients_data) do
      [
        { 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' },
        { 'full_name' => 'Alex Johnson', 'email' => 'alex@example.com' }
      ]
    end

    it 'returns clients matching the search query' do
      query = 'john'
      field = 'full_name'
      matching_clients = Search.fetch_clients(query, field, clients_data)
    
      expect(matching_clients).to contain_exactly(
        { 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'full_name' => 'Alex Johnson', 'email' => 'alex@example.com' }
      )
    end
  end

  describe '.fetch_duplicate_emails' do
    let(:clients_data) do
      [
        { 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' },
        { 'full_name' => 'Alex Johnson', 'email' => 'john@example.com' }
      ]
    end

    it 'returns duplicate email addresses' do
      duplicate_emails = Search.fetch_duplicate_emails(clients_data)

      expect(duplicate_emails).to eq({ 'john@example.com' => 2 })
    end
  end
end
