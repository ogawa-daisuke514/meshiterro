class PostimagesController < ApplicationController
  def new
    @post_image = Postimage.new
  end

  def create
    @post_image = Postimage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to postimages_path
  end

  def index
    @post_images = Postimage.all
  end

  def show
    @post_image = Postimage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = Postimage.find(params[:id])
    @post_image.destroy
    redirect_to postimages_path
  end

  private
  def post_image_params
    params.require(:postimage).permit(:image, :shop_name, :caption)
  end

end
