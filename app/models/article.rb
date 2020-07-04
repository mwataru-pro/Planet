class Article < ApplicationRecord
  belongs_to :admin
  attachment :article_image

  def self.search(search) #self.はArticle.を意味する
    if search
      where(['article_title LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
      all #全て表示させる
    end
  end
end
