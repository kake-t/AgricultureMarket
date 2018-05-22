class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:item_id])
    @items = @user.favorite_items
  end

  def create
    favorite = current_user.favorites.create(item_id: params[:item_id])
    redirect_to item_path(params[:item_id]), notice: "#{favorite.item.item_name}をお気に入りに登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(item_id: params[:item_id]).destroy
    redirect_to item_path(params[:item_id]), notice: "#{favorite.item.item_name}をお気に入り解除しました"
  end
end
