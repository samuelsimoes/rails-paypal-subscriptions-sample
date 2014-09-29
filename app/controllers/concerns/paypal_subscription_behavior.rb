module PaypalSubscriptionBehavior
  def checkout_url
    PaypalSubscription::ResourceFacade.checkout_url(
      paypal_options.merge({
        return_url: make_recurring_subscription_url(subscription),
        cancel_url: subscription_url(subscription, aborting_operation: true)
      })
    )
  end

  def paypal_options
    @paypal_options ||=
      PaypalSubscription::DefaultOptions.for(subscription)
  end
end
