require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  # beforeブロックは同ファイル内の複数のテストで同じデータが必要な場合に、コードをDRYにする為に使用
  # DRY(Don’t Repeat Your Self：繰り返しを避けること)
  # spec/factories/users.rbのテストデータをbuildして＠userに代入
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

    it '名前が10文字を超える場合は無効であること' do
      @user.name = "a" * 11
      @user.valid?
      expect(@user.errors[:name]).to include("は10文字以内で入力してください")
    end

    it 'メールアドレスが空欄なら無効な状態であること' do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it 'メールアドレスが30文字を超える場合は無効であること' do
      @user.email = "a" * 31
      @user.valid?
      expect(@user.errors[:email]).to include("は30文字以内で入力してください")
    end

    it 'パスワードが空欄なら無効な状態であること' do
      @user.password = ""
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
    end

    it 'パスワードが6文字に満たない場合は無効であること' do
      @user.password = "a" * 5
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上で入力してください")
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
