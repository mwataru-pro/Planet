class Article < ApplicationRecord
  belongs_to :admin
  attachment :article_image
end
