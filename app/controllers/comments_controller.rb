class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    comment = current_user.comments.new(comment_params)
    # 上記記述は comment = Comment.new(comment_params) + comment.user_id = current_user.id　の省略形
    comment.post_image_id = @post_image.id
    comment.save
    render :index
  end

  def destroy
    Comment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    @post_image = PostImage.find(params[:post_image_id])
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
