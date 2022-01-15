Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only: [:new, :index, :show]
  resources :users, only: [:show, :edit]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # 今回は新規投稿、一覧、詳細機能、消去しか使わないため
  # create追加

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
