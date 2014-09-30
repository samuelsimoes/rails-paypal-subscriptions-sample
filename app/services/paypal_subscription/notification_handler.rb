class PaypalSubscription::NotificationHandler
  def self.resolve!(*args)
    new(*args).resolve!
  end

  def initialize(subscription:, notification:)
    @subscription, @notification = subscription, notification
  end

  def resolve!
    if canceling_profile?
      @subscription.cancel!
    elsif update_profile?
      @subscription.update(paid_until: @notification.next_payment_date)
    end
  end

  private

  def update_profile?
    successful_recurring_payment? ||
      successful_active_recurring_payment_profile?
  end

  def canceling_profile?
    @notification.type == 'recurring_payment_profile_cancel'
  end

  def successful_active_recurring_payment_profile?
    @notification.recurring_payment_profile? && @notification.profile_status == 'Active'
  end

  def successful_recurring_payment?
    @notification.recurring_payment? && @notification.completed?
  end
end
