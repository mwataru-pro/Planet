class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image

  # バリデーション
  validates :comment, presence: :true
end
