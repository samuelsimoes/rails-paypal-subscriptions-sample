require 'rails_helper'

describe PaypalSubscription::DefaultOptions do
  let(:subscription) {
    object_double(
      Subscription.new,
      id: 2,
      paypal_payer_id: '20',
      paypal_profile_id: '2030',
      price: 20.20,
      paypal_description: 'my super plan'
     )
  }
  let(:current_time) { double }

  before do
    allow(Time).to receive(:current).and_return(current_time)
  end

  it 'generates properly the default options for a subscription' do
    expect(described_class.for(subscription)).to eq({
      period: :monthly,
      outstanding: :no_auto,
      frequency: 1,
      start_at: current_time,
      trial_length: 0,
      payer_id: '20',
      profile_id: '2030',
      reference: 2,
      description: 'my super plan',
      amount: 20.20,
      currency: 'BRL',
      locale: 'pt_BR'
    })
  end
end
