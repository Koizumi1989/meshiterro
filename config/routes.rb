Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only: [:new, :create,:index, :show,:destroy]do
    resources:post_comments,only:[:create,:destroy]
  end
  # コメントは、投稿画像に対してコメントされます。このため、post_commentsは、
  # post_imagesに結びつきます。 以下のように親子関係になります。このことを「ネスト」という
  # ネストすると「params[:post_image_id]」でPostImageのidが取得できるようになります。
  resources :users, only: [:show, :edit, :update]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # 今回は新規投稿、一覧、詳細機能、消去しか使わないため
  # create追加

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
