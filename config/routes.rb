Rails.application.routes.draw do
  resources :post_images,only:[:new,:create,:index,:show,:destroy]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # 今回は新規投稿、一覧、詳細機能、消去しか使わないため
  # create追加
  
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
