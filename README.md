# Warehouse Routing

A simple app that automatically assigns a destination to a product based on its reference and category.

The project is built with Ruby 3.0 and Rails 6.1

### Dependencies

* Ruby 3.0.0
* NodeJS 14.16.1
* Yarn 1.22.10
* PostgreSQL 13.1

### Installation

* Run `bin/setup` this will install the necessary things to get you up and running.

### Testing

* Run `bundle exec rails test:all` this will run all the test cases.

### Technical Overview

Created a method in the Product model that's finding a match of category and reference in the destinations table. else find that matches category or reference in destinations table.

This method runs after validation of the Product.

Added a Destination Model callback to remap all products associated with the destination just in case the record changes its scope of categories and references. This process is better with a background process like Sidekiq with an identifier currently in process to offload the process in the main thread.
