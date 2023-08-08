# Client Search CLI Application

This is a command-line application written in Ruby that allows you to search and analyze client data stored in a JSON file. You can search for clients by name and find clients with duplicate emails.

## Getting Started

### Prerequisites

- Ruby (>= 2.0) (Tested with 2.7.5 and 3.1.2)
- Bundler (for installing dependencies)

### Installation

1. Clone this repository to your local machine or download the source code.

2. Navigate to the project directory:

3. Install the required gems using Bundler:

   bundle install
   
### Usage

**Search Clients**

To search for clients whose names partially match a given query, use the following command:

    ruby client_searchrb --s QUERY

For example, to search for clients with names containing "john":

    ruby client_search.rb --s john

## Find Duplicates

To identify clients with duplicate email addresses, use the following command:

    ruby client_search.rb --d

## Aliases

For your convenience, you can use the full command names as well:

    ruby client_search.rb --search QUERY

    ruby client_search.rb --duplicates

it can also work like --search or --duplicates


### Example

1. Search for clients by name:

    ruby client_search.rb --s john

2. Find clients with duplicate emails:

    ruby client_search.rb --d

3. And to show both:

    ruby client_search.rb --d --s john

### Data File

The application uses a JSON file named `client.json` to store client data. Make sure this file is present in the same directory as `client_search.rb`.

