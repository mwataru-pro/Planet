require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  let(:user) { create(:user) }
  let!(:post_image) { build(:post_image, user_id: user.id)}
  let!(:comment) { build(:comment, user_id: user.id, post_image_id: post_image.id) }
  
  describe 'バリデーションのテスト' do
    context '投稿の確認' do
      it 'contentが空欄でないこと' do
        comment.comment = ""
        comment.valid?
        expect(comment.errors[:comment]).to include("を入力してください")
      end
    end
  end

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