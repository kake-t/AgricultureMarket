class ItemsController < ApplicationController
  def top; end

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
