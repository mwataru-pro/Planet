class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def index
    @post_images = PostImage.all
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
       redirect_to post_images_path
    else
      render 'new'
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])

    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image)
    else
      render 'edit'
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_back (fallback_location :root_path)
  end

  private
    def post_image_params
      params.require(:post_image).permit(:user_id, :title, :content, :image)
    end

end
