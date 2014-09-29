class Subscription < ActiveRecord::Base
  attr_accessor :paypal_payment_token

  belongs_to :plan

  delegate :price, :paypal_description, to: :plan
end
