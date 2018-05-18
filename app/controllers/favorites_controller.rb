class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(item_id: params[:item_id])
    # binding.pry
    redirect_to items_path, notice: "#{favorite.item.item_name}をお気に入りに登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(item_id: params[:item_id]).destroy
    redirect_to items_path, notice: "#{favorite.item.item_name}をお気に入り解除しました"
  end
end
