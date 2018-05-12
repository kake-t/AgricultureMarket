# items
class ItemsController < ApplicationController
  before_action :set_item, only: %i[show]

  def top; end

  def index
    @items = Item.all.order('created_at desc')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: '出品しました'
    else
      render 'new'
    end
  end

  def show

  end

  private

  def item_params
    params.require(:item).permit(:item_name,
                                 :item_image,
                                 :item_image_cache,
                                 :price,
                                 :item_content)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
