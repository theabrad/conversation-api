# Simple Lua api

# Dependencies
* Ruby 2.5.1
* Rails 5.2.1
* Rubygems
* Bundler
* PostgreSQL

# Getting Started
* Install all dependencies
* Run `bundle install`
* `rails db:create` and `rails db:migrate`
* Run `rails -s`

# Creating a user
To create a user send a POST request using Postman
Example:
``` json
{
  user: {
    "username": "foobar",
    "email": "foo@bar.com",
    "password": "password",
    "password_confirmation": "password"
  }
}
```
