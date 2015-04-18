class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end
end
