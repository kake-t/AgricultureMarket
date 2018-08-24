class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @items = @user.favorite_items
  end

  def create
    @item = Item.find(params[:item_id])
    favorite = current_user.favorites.create(item_id: params[:item_id])
    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id]), notice: "#{favorite.item.item_name}をお気に入りに登録しました" }
      format.js {
        @item = Item.find(params[:item_id])
        @favorite = current_user.favorites.find_by(item_id: @item.id)
      }
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: params[:item_id]).destroy
    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id]), notice: "#{favorite.item.item_name}をお気に入り解除しました" }
      format.js {
        @item = Item.find(params[:item_id])
        @favorite = current_user.favorites.find_by(item_id: @item.id)
      }
    end
  end
end
