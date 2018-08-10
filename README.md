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
To create a user send a POST request using Postman to `localhost:3000/users`
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

# User Authentication
To authenticate a user, send a POST request to `localhost:3000/user_token`
``` json
{
  "auth": {
    "email": "foo@bar.com"
    "password": "password"
  }
}
```

# Create Conversations
To create a conversation you must first authenticate a user as done above.
Upon authentication, you should recieve a Json Web Token(JWT). Place That
JWT as a bearer token in Postman's authorization header.
Send a POST request to `localhost:3000/conversations`
``` json
{
  "conversation": {
    "name": "conversation1"
  }
}
```
