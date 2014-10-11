require 'rails_helper'

describe PaypalSubscription::RecurrenceCreator do
  let(:subscription) { object_double(Subscription.new) }
  let(:paypal_options) { { payer_id: '2030' } }
  let(:subject) {
    described_class.new(subscription: subscription, paypal_options: paypal_options)
  }

  before do
    allow(PaypalSubscription::ResourceFacade).to(
      receive(:make_recurring).with(paypal_options).and_return('30')
    )
  end

  it 'creates recurrence for the subscription' do
    expect(subscription).to(
      receive(:update).with(paypal_payer_id: '2030', paypal_profile_id: '30')
    )
    subject.create!
  end
end
