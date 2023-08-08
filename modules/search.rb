# modules/search.rb
module Search
    def self.search_clients(query, field, data)
      data.select { |client| client[field].downcase.include?(query.downcase) }
    end
  
    def self.find_duplicate_emails(data)
      email_counts = Hash.new(0)
  
      data.each do |client|
        email_counts[client['email']] += 1
      end
  
      email_counts.select { |_, count| count > 1 }
    end
  end
  