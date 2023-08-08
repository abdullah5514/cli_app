# spec/data_spec.rb
require_relative '../modules/data'

describe Data do
  describe '.load_data' do
    let(:file_path) { 'data.json' }
    let(:json_data) do
      [
        { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john@example.com' },
        { 'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane@example.com' }
      ]
    end

    it 'loads data from a JSON file' do
      allow(File).to receive(:read).with(file_path).and_return(json_data.to_json)

      result = Data.load_data(file_path)
      expect(result).to eq(json_data)
    end
  end
end
