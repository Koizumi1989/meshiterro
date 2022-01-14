class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    # @post_image は、PostImage.new によって生成された、PostImage の空のモデルです。
    # このコードでは、投稿するデータを PostImage モデルに紐づくデータとして保存する準備をしていて
    # フォームに入力されたデータ(shop_name や caption,image など)が、
    # @post_image に格納されることになっています。
    @post_image.user_id = current_user.id
    # @post_image.user_id(この投稿のuser_id)としてcurrent_user.idの値を代入する、という意味になります。
    # ここから@post_image.user_idの説明
    # 空のモデル(@post_iamge)では、PostImage モデルで定義したカラムを
    # @post_image.user_idのように、"[モデル名].[カラム名]"
    # という形で繋げることで、保存するカラムの中身を操作することができます。
    # ここからcurrent_user.idの説明
    # current_userは、コードに記述するだけで、ログイン中のユーザーの情報を取得できる便利な記述です。
    # ※今回のパターン：このcurrent_userは、ログイン中のユーザー情報を取得することができるため、current_user.id と記述
    # することでログインユーザーのidを取得することができます。
    # 他にもカラムがshop_nameとcaptionがあり、今ログインしているユーザーのお店の名前を表示したい場合には、
    # current_user.shop_nameと記載すれば:今ログインしているユーザーのお店の名前を表示できる
    # カラムの中身
    # @post_image.user_id : 投稿したユーザを識別する ID　今回はこれを保存
    # @post_image.shop_name : お店の名前
    # @post_image.caption : 画像の説明
    @post_image.save
    redirect_to post_images_path
  end
  # PostImageモデルへ保存した後、投稿一覧画面へリダイレクトします。

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  # post_image_paramsメソッドでは、フォームで入力されたデータが、
  # 投稿データとして許可されているパラメータかどうかをチェックしています。
end
