class PostImagesController < ApplicationController
  before_action :authenticate_user!, only:[:new,:show]
  before_action :post_image_restrict, only:[:edit,:update,:destroy]

  def new
    @post_image = PostImage.new
  end

  def index
    @post_images = PostImage.page(params[:page]).per(10).order(created_at: :desc)
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
       redirect_to post_images_path, notice: "新規投稿されました"
    else
      render 'new'
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])

    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image), notice: "投稿内容を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_back (fallback_location :root_path), notice: "投稿を削除しました"
  end

  private
    def post_image_params
      params.require(:post_image).permit(:user_id, :title, :content, :image)
    end

    def post_image_restrict
      post_image = PostImage.find(params[:id])
      if post_image.user != current_user
        redirect_to post_images_path, notice: "⚠️他人の投稿は編集できません"
      end
    end
end
