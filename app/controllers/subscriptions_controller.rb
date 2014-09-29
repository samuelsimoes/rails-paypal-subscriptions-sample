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
