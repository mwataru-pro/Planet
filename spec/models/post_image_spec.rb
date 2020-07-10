require 'rails_helper'

RSpec.describe 'PostImageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post_image) { build(:post_image, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post_image.title = ""
        expect(post_image.valid?).to eq false;
      end
    end

    context 'contentカラム' do
      it '空欄でないこと' do
        post_image.content = ""
        expect(post_image.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostImage.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
