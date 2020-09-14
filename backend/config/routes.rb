Rails.application.routes.draw do
  resources :events do
    resources :drivers, only: [:index, :create]
  end

  resources :drivers, only: [:show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
