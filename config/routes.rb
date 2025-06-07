Rails.application.routes.draw do
  get "brag" => "brag#index"
  resources :quests
  root "quests#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :quests do
    delete :destroy_multiple, on: :collection
  end
  resources :quests do
    member do
      patch :toggle_complete
    end
  end
end
