# items
class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  def top; end

  def index
    @items = Item.all.order('created_at desc')
  end

  def new
    @item = if params[:back]
              Item.new(item_params)
              @item.item_image.retrieve_from_cache! params[:cache][:item_image]
            else
              Item.new
            end
  end

  def create
    @item = Item.new(item_params)
    @item.item_image.retrieve_from_cache! params[:cache][:item_image]
    if @item.save
      redirect_to items_path, notice: '出品しました'
    else
      render 'new'
    end
  end

  def show; end

  def edit
    if params[:back]
      @item_image = Item.find(params[:id])
      @item = Item.new(item_params)
    else
      set_item
    end
  end

  def update
    @item.item_image.retrieve_from_cache! params[:cache][:item_image]
    if @item.update(item_params)
      redirect_to items_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: '削除しました'
  end

  def confirm
    @item = Item.new(item_params)
    render 'new' if @item.invalid?
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
