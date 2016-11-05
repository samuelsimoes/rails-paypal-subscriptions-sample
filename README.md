#Rails PayPal subscription sample app

[![Build Status](https://semaphoreapp.com/api/v1/projects/2c68eb02-dccd-4080-bef0-d68649b7d447/265905/badge.png)](https://semaphoreapp.com/samuelsimoes/rails-paypal-subscriptions-sample)

This is a very simple Rails app showing an approach to create an app with PayPal subscriptions.

##Installation

1. Run `cp .env.sample .env` 
2. update your PayPal credentials on `.env` file. Find them on https://developer.paypal.com/developer/accounts/
3. Run `gem install foreman`
3. Run `bundle install`
4. Run `bundle exec rake db:setup`
4. Start the app with `foreman start`
5. Read more about this app and PayPal subscriptions on **[Rails with PayPal subscriptions guide](http://blog.samuelsimoes.com/rails/2014/11/01/part-1-rails-with-paypal-subscription-guide.html)**.


## Deploy now

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## IPN Simulation

Once deployed on Heroku you can [simulate an instant payment notification from Paypal Dashboard](https://developer.paypal.com/developer/ipnSimulator/).

_IPN handler URL_: *https://yourappname.herokuapp.com/paypal/ipn_listener*

_Transaction type_: *eCheck - complete*

_Paypal Payer ID_: *from subscription page*

_txn_type_: *recurring_payment*

_custom_: *empty*

_invoice_: *id of subscription*

## Credits

_@samuelsimoes ~ samuel@samuelsimoes.com ~ [samuelsimoes.com](http://samuelsimoes.com)_

_@coorasse ~ coorasse@gmail.com ~ [https://medium.com/@coorasse](https://medium.com/@coorasse)_

