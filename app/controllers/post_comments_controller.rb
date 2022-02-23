class PostCommentsController < ApplicationController

  def create
    post_image = Postimage.find(params[:postimage_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.postimage_id = post_image.id
    comment.save
    redirect_to postimage_path(post_image)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to postimage_path(params[:postimage_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
