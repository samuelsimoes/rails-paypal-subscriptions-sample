class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(params.require(:plan).permit(:name, :description, :paypal_description, :price))
    redirect_to [:edit, @plan]
  end
end
