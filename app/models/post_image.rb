class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # post image belongs to user(postimageは1人のユーザに属してる。）
end
