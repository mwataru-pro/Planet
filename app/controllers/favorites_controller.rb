class FavoritesController < ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: @post_image.id)
    favorite.save
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    favorite = Favorite.find_by(post_image_id: @post_image.id, user_id: current_user.id)
    favorite.destroy
  end
end
