require 'rails_helper'

RSpec.describe 'Articleモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:admin) { create(:admin) }
    let!(:article) { build(:article, admin_id: admin.id) }

    context 'article_titleカラム' do
      it '空欄でないこと' do
        article.article_title = ""
        expect(article.valid?).to eq false;
      end
    end

    context 'article_contentカラム' do
      it '空欄でないこと' do
        expect(article.valid?).to eq false;
      end
    end

    context 'article_imageカラム' do
      it '空欄でないこと' do
        expect(article.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Adminモデルとの関係' do
      it 'N:1の関係である' do
        expect(Article.reflect_on_association(:admin).macro).to eq :belongs_to
      end
    end
  end
end
