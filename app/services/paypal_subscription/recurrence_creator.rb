class PaypalSubscription::RecurrenceCreator
  def self.create!(*args)
    new(*args).create!
  end

  def initialize(subscription:, paypal_options:)
    raise MissingSubscription if subscription.blank?

    @subscription = subscription
    @paypal_options = paypal_options
  end

  def create!
    @subscription.update(
      paypal_payer_id: @paypal_options[:payer_id],
      paypal_profile_id: profile_id
    )
  end

  private

  def profile_id
    PaypalSubscription::ResourceFacade.make_recurring(@paypal_options)
  end
end
