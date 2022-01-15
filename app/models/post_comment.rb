class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  # UserモデルもPostImageモデルも関連付けられるのは1つのため、
  # belongs_toを記述します。
end
