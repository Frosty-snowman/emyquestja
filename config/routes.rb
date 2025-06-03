Rails.application.routes.draw do
  get "brag" => "brag#index"
  resources :quests

  root "quests#index"

  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :quests do
    delete :destroy_multiple, on: :collection
  end
  
end
