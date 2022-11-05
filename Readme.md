# Pico API

A tiny boilerplate JSON API template in ruby. Its minimal footprint makes it ideal for microservices or even full blown APIs.
It has been created for those who don't need the RAILS "magic" and bloat. Can easily create different architectures, like STAR, CQRS..., and MVC.

Pico API is just a collection of the fastest ruby libraries put together to form a basic API environment, with the JSON:API specification. It doesn't create any folder structures for your business logic, it only creates the initial configurations to get you started.

Example demo project can be found [here](https://github.com/alexavlonitis/pico_api_example)

## Libraries Used

- Rack -> Backbone
- [roda](https://github.com/jeremyevans/roda) -> Routing
- [rom-rb](https://github.com/rom-rb/rom) -> ORM
- [jsonapi serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) -> Fast-jsonapi fork

## Usage

### Create your app

```ruby
gem install pico_api

pico_api --new my_app

cd my_app

bundle install
```

### Configure your database

Migration info: https://rom-rb.org/5.0/learn/sql/migrations/

- Add the database config details in `config/database.yml`
- Setup the Database: `rake db:setup`
- Create a migration: `rake db:create_migration[create_users]` (include your preferred DB gem in the Gemfile)
- Run the migrations: `rake db:migrate`
- Run the server:     `rackup -p 3001`


## Development
- [x] Create Database config
- [x] Hook a json-api library
- [x] Handle Errors
- [ ] Create a Logger config
- [ ] Create a testing environment
- [x] Allow multiple db gateways in the config
- [ ] Add irb/pry console script

## Contributing

All Pull Requests are welcome, from a single typo to a new feature.

- Fork this repo
- Create a new branch, add your changes with tests when necessary
- Submit a Pull Request
