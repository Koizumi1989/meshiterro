class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
    # 特定のユーザ（@user）に関連付けられた投稿全て（.post_images）
    # を取得し@post_imagesに渡す という処理を行うことができます。
    # 結果的に、全体の投稿ではなく、個人が投稿したもの全てを表示できます。
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    # ユーザーズのshow画面へ飛ぶようにする。現段階では個別のshow画面へのリンクは未作成。
    # エラーの原因はパスは個別のshow画面で()内はusersのidを記載していた。
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
