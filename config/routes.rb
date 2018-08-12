Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :users do
    resources :conversations, only: [:index] do
      post 'adduser' => 'conversations#add_user'
    end
  end
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
