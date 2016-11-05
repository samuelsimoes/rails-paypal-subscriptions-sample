Rails.application.routes.draw do
  resources :subscriptions do
    get :make_recurring, on: :member
  end

  resources :plans

  post 'paypal/ipn_listener' => 'paypal#ipn_listener'

  root 'plans#index'
end
