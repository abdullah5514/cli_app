# spec/search_spec.rb
require_relative '../modules/search'

describe Search do
  describe '.search_clients' do
    let(:clients_data) do
      [
        { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' },
        { 'id' => 3, 'full_name' => 'Alex Johnson', 'email' => 'alex@example.com' }
      ]
    end

    it 'returns clients matching the search query' do
      query = 'john'
      field = 'full_name'

      result = Search.search_clients(query, field, clients_data)
      expect(result).to eq([
        { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john@example.com' }
      ])
    end
  end

  describe '.find_duplicate_emails' do
    let(:clients_data) do
      [
        { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' },
        { 'id' => 3, 'full_name' => 'Another Jane Smith', 'email' => 'jane@example.com' }
      ]
    end

    it 'returns duplicate email addresses' do
      result = Search.find_duplicate_emails(clients_data)
      expect(result).to eq({ 'jane@example.com' => 2 })
    end
  end
end
