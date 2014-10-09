require 'rails_helper'

describe PaypalSubscription::ResourceFacade do
  let(:resource) { object_double(PayPal::Recurring.new) }
  let(:options) { { id: 20 } }

  before(:each) do
    expect(PayPal::Recurring).to receive(:new).and_return(resource).with(options)
  end

  describe '#checkout_url' do
    before do
      allow(resource).to(
        receive(:checkout)
          .and_return(double(checkout_url: 'http://checkout.com', errors: nil))
      )
    end

    it 'generates the checkout URL' do
      expect(described_class.checkout_url(options)).to eq('http://checkout.com')
    end
  end

  describe '#make_recurring' do
    before do
      allow(resource).to(
        receive(:create_recurring_profile)
          .and_return(double(profile_id: '2030', errors: nil))
      )
    end

    it 'generates the checkout URL' do
      expect(described_class.make_recurring(options)).to eq('2030')
    end
  end

  describe '#cancel' do
    let(:cancel_request) { double(errors: nil) }

    before do
      allow(resource).to(receive(:cancel).and_return(cancel_request))
    end

    it 'generates the checkout URL' do
      expect(described_class.cancel(options)).to eq(cancel_request)
    end
  end
end
