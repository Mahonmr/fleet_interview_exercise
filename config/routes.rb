Rails.application.routes.draw do
  resources :shipments do
    collection { post :import }
  end

  root to: "shipments#index"
end
