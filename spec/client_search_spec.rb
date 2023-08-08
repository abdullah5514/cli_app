require 'rspec'
require_relative '../client_search'
require 'open3'

describe ClientSearch do
  describe '#run' do
    context 'when --search option is provided' do
      it 'prints matching clients' do
        # Create a new instance of ClientSearch
        client_search = ClientSearch.new
        
        # Simulate the --search option with a search query
        client_search.instance_variable_set(:@options, { search: 'John' })
        
        # Define mock client data for testing
        client_data = [
          { 'full_name' => 'John Doe', 'email' => 'john@example.com' }
        ]
        
        # Set up stubs for ClientData and Search methods
        allow(ClientData).to receive(:load_data).and_return(client_data)
        allow(Search).to receive(:fetch_clients).and_call_original
        
        # Run the command and capture its output and exit status
        output, status = Open3.capture2('ruby', 'client_search.rb', '--search', 'John')
        
        # Compare the captured output with the expected output
        expect(output).to eq("Matching clients:\nJohn Doe (john.doe@gmail.com)\nAlex Johnson (alex.johnson@hotmail.com)\n")
        
        # Check the exit status (0 usually indicates success)
        expect(status.exitstatus).to eq(0)
      end

      it 'prints no clients found when no matches' do
        # ... (similar setup)
        
        # Run the command and capture its output and exit status
        output, status = Open3.capture2('ruby', 'client_search.rb', '--search', 'hellex')
        
        # Compare the captured output with the expected output
        expect(output).to eq("No clients found matching the search query.\n")
        
        # Check the exit status (0 usually indicates success)
        expect(status.exitstatus).to eq(0)
      end
    end

    context 'when --duplicate option is provided' do
      it 'prints clients with duplicate emails' do
        # ... (similar setup)
        
        # Run the command and capture its output and exit status
        output, status = Open3.capture2('ruby', 'client_search.rb', '--duplicate')
        
        # Define the expected output
        expected_output = "Clients with duplicate emails:\nEmail: jane.smith@yahoo.com (Count: 2)\n  - Jane Smith (ID: 2)\n  - Another Jane Smith (ID: 15)\n"
        
        # Compare the captured output with the expected output
        expect(output).to eq(expected_output)
        
        # Check the exit status (0 usually indicates success)
        expect(status.exitstatus).to eq(0)
      end
    end
  end
end
