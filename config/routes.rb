Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :prototypes do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show]
  resources :prototypes, only: [:edit, :update, :destroy]

end