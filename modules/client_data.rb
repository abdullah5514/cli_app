# modules/client_data.rb
require 'json'

module ClientData
  def self.load_data(file_path)
    JSON.parse(File.read(file_path))
  end
end
