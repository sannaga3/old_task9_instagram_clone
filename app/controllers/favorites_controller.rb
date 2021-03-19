class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to picture_path(params[:picture_id]), notice: "お気に入りに登録しました"
  end
  
  def destroy   
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to request.referer, notice: "お気に入り解除しました" || pictures_path 
  end
end
