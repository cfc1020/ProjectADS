ProjectADS::Application.routes.draw do
  resources  :ads do
    post 'transfer_state', on: :member
    collection { get :search }
    resources :comments, :except => [:new, :show, :index]
    resources :images, only: :destroy
  end

  root :to => "ads#index"

  devise_for :users
  get "users/show", as: "user_root"

  namespace :admin do
    root :to => "static_pages#adminka"
    resources :types, :except => [:show]
    get "static_pages/adminka"
    get "ads/moderate"
    resources :users, :except => [:show, :new, :create]
  end
end
