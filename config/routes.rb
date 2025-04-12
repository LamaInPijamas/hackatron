Rails.application.routes.draw do
  root "dashboard#index"

  get "dashboard/index"

  resources :data_uploads
  resources :microgrid_configs
end
