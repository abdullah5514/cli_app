require 'json'

module ClientData
  # This module provides a method to load client data from a JSON file.
  module_function
  
  # Load client data from a JSON file.
  #
  # @param file_path [String] The path to the JSON file containing client data.
  # @return [Array] An array of client data objects.
  def load_data(file_path)
    JSON.parse(File.read(file_path))
  end
end
