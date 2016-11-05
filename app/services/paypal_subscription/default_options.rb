class PaypalSubscription::DefaultOptions
  def self.for(subscriptable)
    {
      period: :monthly,
      outstanding: :no_auto,
      frequency: 1,
      start_at: Time.current,
      trial_length: subscriptable.plan.trial_length || 0,
      payer_id: subscriptable.paypal_payer_id,
      profile_id: subscriptable.paypal_profile_id,
      reference: subscriptable.id,
      description: subscriptable.paypal_description,
      amount: subscriptable.price,
      currency: 'EUR',
      locale: 'en_US'
    }
  end
end
