# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Students are dropped into a pre-built app using a new Ruby language and asked to replicate real-world scenarios of adding features, fixing bugs and adding testing to an existing app.

## Creating & Completing Orders

![Creating & Completing Orders](https://github.com/woobrendan/Jungle-Rails/blob/master/public/docs/Jungle_Order.gif)

## Setup

1. Run `bundle install` to install dependencies
2. Run `bin/rake db:reset` to create, load and seed db
3. Sign up for a [Stripe](https://stripe.com/en-gb-ca) account
4. Put Stripe (test) keys into appropriate .env vars
5. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Testing

- Rspec
- Capybara
- Poltergeist
