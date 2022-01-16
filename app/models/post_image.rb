class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # post image belongs to user(postimageは1人のユーザに属してる。）
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  # get_imageをPostImageモデルの中に記述することで、カラムを呼び出すようにこの処理（メソッド）
  # を呼び出すことができるようになります。
  # get_imageメソッドの意味：このメソッドの内容は、画像が設定されない場合はapp/assets/imagesに
  # 格納されているno_image.pngという画像をデフォルト画像としてをActiveStorageに格納し、格納した
  # 画像を表示するというものです。
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
