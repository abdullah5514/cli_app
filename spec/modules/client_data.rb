require 'rspec'
require_relative '../../modules/client_data'

describe ClientData do
  describe '.load_data' do
    it 'loads client data from a JSON file' do
      # Define a mock file path and client data for testing
      file_path = 'test_data.json'
      client_data = [
        { 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' }
      ]
      
      # Stub the File.read method to return the mock client data
      allow(File).to receive(:read).with(file_path).and_return(client_data.to_json)
      
      # Call the method being tested
      loaded_data = ClientData.load_data(file_path)
      
      # Compare the loaded data with the expected client data
      expect(loaded_data).to eq(client_data)
    end
  end
end
