class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User(params[:id])
    if @user.update(user_params)
    redirect_to admin_user_path(@user), notice: "会員情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
    redirect_to admin_users_path, notice: "会員情報を削除しました"
    else
      render 'show'
    end
  end
end
