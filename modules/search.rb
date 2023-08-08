module Search
  # This module provides methods to search and manipulate client data.
  module_function
  
  # Fetch clients matching the search query in a specific field.
  #
  # @param query [String] The search query to match against client data.
  # @param field [String] The field to search within (e.g., 'full_name', 'email').
  # @param data [Array] An array of client data objects.
  # @return [Array] An array of client data objects matching the search query.
  def fetch_clients(query, field, data)
    data.select { |client| client[field].downcase.include?(query.downcase) }
  end

  # Fetch email addresses with duplicate occurrences in the client data.
  # @param data [Array] An array of client data objects.
  # @return [Hash] A hash with email addresses as keys and their occurrence count as values.
  def fetch_duplicate_emails(data)
    email_counts = Hash.new(0)

    data.each do |client|
      email_counts[client['email']] += 1
    end

    email_counts.select { |_, count| count > 1 }
  end
end
