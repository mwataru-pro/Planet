require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  # 名前を空欄で登録できない。空欄で登録しようとしたらfalse。

 describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
    end
 end

  describe 'アソシエーションのテスト' do
    context 'Post_imageモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_images).macro).to eq :has_many
      end
    end

    context 'Relationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:active_relationships).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
