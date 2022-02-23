Rails.application.routes.draw do
  #devise_for, resources :user は競合する(/users/:id, :id="sign_in")ので、順番を入れ替えるとサインインできなくなる。へー
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :postimages, only: [:show, :index, :new, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
