require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "バリデーションのテスト" do
    it '名前、メールアドレス、パスワードが有効な状態であること' do
      expect(@user).to be_valid
    end

    it '名前が空欄なら無効な状態であること' do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it 'メールアドレスが空欄なら無効な状態であること' do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it 'パスワードが空欄なら無効な状態であること' do
      @user.password = ""
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
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
