Rails.application.routes.draw do
  resources :events do
    resources :drivers, only: [:index, :create]
    resources :vehicles, only: [:index, :create]
  end

  resources :drivers, only: [:show, :update, :destroy]
  resources :vehicle_makes, except: [:new, :edit]
  resources :vehicles, only: [:show, :update, :destroy]
end
