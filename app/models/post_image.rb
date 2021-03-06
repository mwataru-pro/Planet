class PostImage < ApplicationRecord
  # アソシエーション
  belongs_to :user
  attachment :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true 
end
