class Subscription < ApplicationRecord
  attr_accessor :paypal_payment_token

  belongs_to :plan

  delegate :price, :paypal_description, to: :plan

  def cancel!
    update(canceled: true)
  end

  def paid?
    return false if paid_until.blank?
    paid_until >= Time.current
  end

  def trial?
    return false if paid_until.blank?
    paid_until < created_at
  end
end
