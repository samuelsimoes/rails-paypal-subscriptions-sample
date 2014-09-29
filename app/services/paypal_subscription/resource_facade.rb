class PaypalSubscription::ResourceFacade
  def self.checkout_url(options)
    process_action(action_name: :checkout, options: options).
      checkout_url
  end

  def self.make_recurring(options)
    process_action(action_name: :create_recurring_profile, options: options).
      profile_id
  end

  def self.cancel(options)
    process_action(action_name: :cancel, options: options)
  end

  protected

  def self.process_action(action_name:, options: {})
    ppr = PayPal::Recurring.new(options)

    response = ppr.send(action_name)

    raise response.errors.inspect if response.errors.present?

    response
  end
end
