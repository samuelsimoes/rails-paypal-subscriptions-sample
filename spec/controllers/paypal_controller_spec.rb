require 'rails_helper'

describe PaypalController do
  let(:subscription) { object_double(Subscription.new) }
  let(:notification) {
    instance_double('PayPal::Recurring::Notification',
                    reference: '203',
                    payer_id: '3020')
  }

  describe '#ipn_listener' do
    let(:paypal_notification_params) {
      {
        'txn_type'=>'foo',
        'controller'=>'paypal',
        'action'=>'ipn_listener'
      }
    }

    before do
      expect(PaypalSubscription::NotificationHandler).to(
        receive(:resolve!)
          .with(subscription: subscription, notification: notification)
          .and_return(true)
      )

      expect(PayPal::Recurring::Notification).to(
        receive(:new).with(paypal_notification_params).and_return(notification)
      )

      expect(Subscription).to(
        receive(:find_by!)
          .with(id: notification.reference, paypal_payer_id: notification.payer_id)
          .and_return(subscription)
      )
    end

    it 'handles correctly with the notification' do
      get :ipn_listener, paypal_notification_params
    end
  end
end
