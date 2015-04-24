##Rails PayPal subscription sample app

[![Build Status](https://semaphoreapp.com/api/v1/projects/2c68eb02-dccd-4080-bef0-d68649b7d447/265905/badge.png)](https://semaphoreapp.com/samuelsimoes/rails-paypal-subscriptions-sample)

This is a very simple Rails app showing an aproach to create an app with PayPal subscriptions.

You can read more about this app and PayPal subscriptions on **[Rails with PayPal subscriptions guide](http://blog.samuelsimoes.com/rails/2014/11/01/part-1-rails-with-paypal-subscription-guide.html)**.

#Instalation

1. Run `cp .env.sample .env` and update your PayPal credentials on `.env` file
2. Run `gem install foreman`
3. Run `bundle install; bundle exec rake db:setup`
4. Start the app with `foreman start`

_@samuelsimoes ~ slip.cm@gmail.com ~ samuelsimoes.com_
