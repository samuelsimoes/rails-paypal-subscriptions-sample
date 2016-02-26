Rails.application.routes.draw do
  resources :subscriptions do
    member do
      get :make_recurring
    end
  end

  resources :plans

  post 'paypal/ipn_listener' => 'paypal#ipn_listener'

  root 'plans#index'
end
