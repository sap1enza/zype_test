# README

Sample project for a test case


### Setup
- bundle install
- bin/setup
- rails s

### Solution

Gems

- HTTParty ( http handler )
- Rspec ( for good practices sake )
- DatabaseCleaner ( to ensure we will not have order-dependent specs )
- Dotenv ( To manage environment variables on development without exposing them on the PR )
- Rubocop ( for good practices sake )
- VCR ( To mock HTTP requests, we don't want to make an extra call each time we run a spec )


Architecture

- Uses a config file to centralize API settings ( store api keys, base_urls and more )
- Created API Services with `BaseService` being the base class to manage minimum configuration for any service that might connect to an external api in the future
- Created a `Zype API Service` inheriting from `BaseService` with abstracts settings and defines a method for each api call

- Created a `RecursiveOpenStruct` which parses a hash to OpenStruct recursively
- Created a presenter which defines self object ( using `RecursiveOpenStruct` ) as the received one ( to delegate all existent attributes as a method, without the need to be defining them again )

- Have split helper methods in specific files
  - ApplicationHelper for handling authentication
  - PaginationHelper for handling pagination and check if should shown the next button or previous button
  - PlayerHelper for handling embed player

- Authentication uses a simple `session` from ruby setting the expiration_at from the api response call ( to ensure it will be the same ) = may change in the future
