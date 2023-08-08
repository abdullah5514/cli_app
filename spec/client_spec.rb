# spec/data_spec.rb
require_relative '../modules/data'

describe Data do
  describe '.load_data' do
    it 'loads client data from a JSON file' do
      data = Data.load_data('client.json')
      expect(data).to be_an(Array)
    end
  end
end

# spec/search_spec.rb
require_relative '../modules/search'

describe Search do
  describe '.search_clients' do
    it 'returns clients matching the search query' do
      # Write your test case here
    end
  end

  describe '.find_duplicate_emails' do
    it 'returns duplicate email addresses' do
      # Write your test case here
    end
  end
end

# spec/ui_spec.rb
require_relative '../modules/ui'

describe UI do
  # Write your UI-related test cases here
end
