require 'rails_helper'

describe SubscriptionsController do
  let(:subscription) { object_double(Subscription.new) }
  let(:options) { Hash.new }

  describe '#make_recurring' do
    before do
      expect(Subscription).to(
        receive(:find)
          .with('20')
          .and_return(subscription)
      )

      expect(PaypalSubscription::DefaultOptions).to(
        receive(:for)
          .with(subscription)
          .and_return(options)
      )

      expect(PaypalSubscription::RecurrenceCreator).to(
        receive(:create!)
          .with(
            subscription: subscription,
            paypal_options: {
              payer_id: '2030',
              token: '30203'
            }
          )
          .and_return(true)
      )
    end

    it 'creates the recurrence for the subscription' do
      get :make_recurring, { 'id' => '20', 'PayerID' => '2030', 'token' => '30203' }
    end
  end
end
