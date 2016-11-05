require 'rails_helper'

describe Subscription do
  let(:subscription) { described_class.create }

  describe '#cancel!' do
    before { subscription.cancel! }

    it { expect(subscription.canceled?).to be_truthy }
  end
end
