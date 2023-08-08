# Flexible JSON Search Command-Line Application

This is a command-line application that allows you to search through JSON datasets and perform various actions on the data. The application is designed to be modular, flexible, and scalable, with potential to expand its current features.

## Features

1. **Search by Dynamic Field:** You can search through JSON data by specifying which field to search. The application supports dynamic searches on different fields, not limited to just names.

2. **Find Duplicate Emails:** The application can identify clients with duplicate email addresses in the dataset and display the duplicates if any are found.

3. **Modular Architecture:** The application is organized into modules, making it easy to add new features or modify existing ones without affecting other parts of the application.

4. **User-Friendly Interface:** The user interface module provides clear prompts and displays results in a human-readable format.

5. **Scalability Considerations:** The application is designed with scalability in mind, considering efficient search algorithms, caching, and potential database integration.

## Usage

1. **Installation:**
   - Clone this repository: `git clone git@github.com:abdullah5514/cli_app.git`
   - Install dependencies: `bundle install`

2. **Running the Application:**
   - Navigate to the project directory.
   - Run the application: `ruby main.rb`

3. **Commands:**
   - Choose an action:
     1. Search clients by a specific field (e.g., name, email).
     2. Find clients with duplicate emails.
     3. Exit the application.

4. **Dynamic Search:**
   - When searching, you can specify which field to search (e.g., "name", "email").

5. **API Support (Optional):**
   - To add REST API support, extend the API module to handle incoming HTTP requests.
   - Define routes to accept query parameters, such as `GET /query?q=<search-query>&field=<search-field>`.

## Tests

1. **Running Tests:**
   - Run tests: `bundle exec rspec`

2. **Unit Tests:**
   - Tests cover individual modules and functionalities.
   - Mock data or JSON files are used for testing.

3. **Integration Tests:**
   - Tests ensure seamless interaction between modules.

## Extending and Scaling

1. **Dynamic Search:**
   - Modify the search module to accept a field parameter for dynamic searches.

2. **API Support (Optional):**
   - Extend the API module to handle incoming requests and connect with the search module.

3. **Scalability:**
   - Consider efficient search algorithms, caching, and database integration.
   - Monitor performance and consider auto-scaling techniques for increased demand.

## Contributing

We welcome contributions to enhance and expand the functionality of this application. Feel free to submit pull requests for new features, bug fixes, or improvements.

## License

This project is licensed under the [MIT License](LICENSE).

