class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_restrict, only:[:edit]

  def index
    @users = User.all.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "会員情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params)
    @user.destroy
    redirect_to root_path, notice: "退会しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

  def user_restrict
    user = User.find(params[:id])
    if user != current_user
      redirect_to post_images_path, notice: "⚠️他人の会員情報は編集できません"
    end
  end
end
