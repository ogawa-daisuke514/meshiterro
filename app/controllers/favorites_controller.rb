class FavoritesController < ApplicationController

  def create
    post_image = Postimage.find(params[:postimage_id])
    favorite = post_image.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to postimage_path(post_image)
  end

  def destroy
    post_image = Postimage.find(params[:postimage_id])
    favorite = post_image.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to postimage_path(post_image)
  end
end
