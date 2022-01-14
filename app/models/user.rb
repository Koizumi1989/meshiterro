class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post_images,dependent: :destroy
  # has many post image（たくさんpost imageを持っている）
  # dependent destroy(1:Nの1側が消去された時、N側全消去)
  # 1側：user N側：post image
end
