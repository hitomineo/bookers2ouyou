Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
     resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
   end
  resources :users, only: [:index,:show,:edit,:update,:create]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
   get "search" => "searches#search"
end