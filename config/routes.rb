Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  resources :postimages, only: [:show, :index, :new, :create, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
