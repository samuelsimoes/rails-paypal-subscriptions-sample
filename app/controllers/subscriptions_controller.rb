class SubscriptionsController < ApplicationController
  include PaypalSubscriptionBehavior

  def index
    @subscriptions = Subscription.all
  end

  def show
  end

  def create
    @subscription = Subscription.create(subscription_params)
    redirect_to checkout_url
  end

  def make_recurring
    if PaypalSubscription::RecurrenceCreator.create!(
        subscription: subscription,
        paypal_options: paypal_options.merge({
          payer_id: params[:PayerID],
          token: params[:token]
        })
      )
      redirect_to subscription_path(subscription),
        notice: I18n.t('flashes.subscription.successfully_created')
    end
  end

  def destroy
    @subscription.destroy
    redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.'
  end

  private

  def subscription
    @subscription ||= Subscription.find(params[:id])
  end
  helper_method :subscription

  def subscription_params
    params.permit(:plan_id)
  end
end
