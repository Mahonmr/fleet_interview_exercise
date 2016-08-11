Rails.application.routes.draw do
  resources :shipments do
    collection { post :import }
    post :activate, on: :member
  end

  root to: "shipments#index"
end
