# Jungle

Jungle is a mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. The purpose of this project was being able to implement bug fixes and feature edits after being given an existing codebase.

# Features/Bug fixes

- Sold out items will display a "SOLD OUT!" badge.
- Http basic authentication to access the admin dashboard and admin product/categories pages.
- User registration/login.
- Order details are displayed on the confirmation page.
- Fixed bug where prices weren't formatted correctly on certain pages.
- Fixed bug where my cart screen shows nothing if cart is empty and implemented a message indicating that.

# Gifs

### Registration

![](https://i.gyazo.com/e0fabc64e828fa4a08418a60158f3376.gif)

### Login

![](https://i.gyazo.com/dec6c8fa90549c5d427fd9eca395ede4.gif)

### Add to Cart

![](https://i.gyazo.com/64b667e12353d1c29bcc36cf50f5f787.gif)

### Access Admin Product Page

![](https://i.gyazo.com/85b47a78cf1b0abdfcabe0eade672b5a.gif)

### Complete Order

![](https://i.gyazo.com/a16b2d2d5941c5a7a3c5d7e904912171.gif)

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
1. Remove Gemfile.lock
1. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
