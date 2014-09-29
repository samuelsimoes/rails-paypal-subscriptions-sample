class PaypalController < ApplicationController
  protect_from_forgery except: [:ipn_listener]

  def ipn_listener
    render nothing: true
  end
end
