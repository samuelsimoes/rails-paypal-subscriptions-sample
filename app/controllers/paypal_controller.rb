class PaypalController < ApplicationController
  protect_from_forgery except: [:ipn_listener]

  def ipn_listener
    if params[:txn_type].present?
      PaypalSubscription::NotificationHandler.resolve!(
        subscription: subscription,
        notification: notification
      )
    end

    render nothing: true
  end

  private

  def subscription
    @subscription ||=
      Subscription.find_by!(
        id: notification.reference,
        paypal_payer_id: notification.payer_id
      )
  end

  def notification
    @notification ||= PayPal::Recurring::Notification.new(params)
  end
end
