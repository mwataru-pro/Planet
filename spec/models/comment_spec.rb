require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1の関係になっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'PostImageモデルとの関係' do
      it 'N:1の関係となっていること' do
        expect(Comment.reflect_on_association(:post_image).macro).to eq :belongs_to
      end
    end
  end
end