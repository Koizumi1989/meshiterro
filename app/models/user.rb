class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images,dependent: :destroy
  # has many post image（たくさんpost imageを持っている）
  # dependent destroy(1:Nの1側が消去された時、N側全消去)
  # 1側：user N側：post
  # モデル同士の関連付け
  # 下記はpostimageモデルとpostcommentモデルの関連付け
  has_many :post_comments, dependent: :destroy

  has_one_attached :profile_image
  # has_one_attached :profile_imageという記述により、profile_imageという
  # 名前でActiveStorageでプロフィール画像を保存できるように設定しました。

  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize: size).processed
  end
  # 同じような記述をPostImageモデルに記述を行いました
  # メソッドに対して引数を設定し、引数に設定した値に画像
  # のサイズを変換するようにしました。
end
