require 'rails_helper'

RSpec.describe 'PostImageモデルのテスト', type: :model do
  # タイトルを空欄で登録できない。
  # 内容を空欄で登録できない。

  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post_image) { build(:post_image, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post_image.title = ""
        expect(post_image.valid?).to eq false;
      end

      it '空欄ならば無効な状態でエラーメッセージが表示されること' do
        post_image.title = ""
        post_image.valid?
        expect(post_image.errors[:title]).to include("を入力してください")
      end
    end

    context 'contentカラム' do
      it '空欄でないこと' do
        post_image.content = ""
        expect(post_image.valid?).to eq false;
      end

      it '空欄ならば無効な状態でエラーメッセージが表示されること' do
        post_image.content = ""
        post_image.valid?
        expect(post_image.errors[:content]).to include("を入力してください")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostImage.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(PostImage.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
