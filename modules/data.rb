# modules/data.rb
require 'json'

module Data
  def self.load_data(file_path)
    JSON.parse(File.read(file_path))
  end
end
