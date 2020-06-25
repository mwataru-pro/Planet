class CommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.comments.new(comment_params)
    # 上記記述は comment = Comment.new(comment_params) + comment.user_id = current_user.id　の省略形
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    Comment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
