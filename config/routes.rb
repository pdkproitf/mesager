Rails.application.routes.draw do
  get 'messages/show'

  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end

  root 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
