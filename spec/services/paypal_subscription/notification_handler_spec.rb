require 'rails_helper'

describe PaypalSubscription::NotificationHandler do
  let(:subscription) { object_double(Subscription.new) }
  let(:notification) { instance_double('PayPal::Recurring::Notification') }
  let(:subject) {
    described_class.new(subscription: subscription, notification: notification)
  }

  context 'with a canceling notification' do
    let(:notification) {
      instance_double('PayPal::Recurring::Notification',
                      type: 'recurring_payment_profile_cancel')
    }

    it 'cancels the subscription' do
      expect(subscription).to receive(:cancel!)
      subject.resolve!
    end
  end

  context 'with a valid update notification' do
    let(:next_payment_date) { Time.new }
    let(:notification) {
      instance_double('PayPal::Recurring::Notification',
                      type: nil,
                      recurring_payment_profile?: true,
                      next_payment_date: next_payment_date,
                      profile_status: 'Active',
                      recurring_payment?: true,
                      completed?: true)
    }

    it 'updates the paid until column' do
      expect(subscription).to receive(:update).with(paid_until: next_payment_date)
      subject.resolve!
    end
  end
end
