# items
class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy buy_confirm buy_complete]
  before_action :check_current_user_producer_nil?, only: [:new]
  before_action :check_item_state, only: [:edit]

  def top; end

  def index
    @items = Item.all.order('created_at desc')
  end

  def new
    if params[:back]
      @item = current_user.selling_items.new(item_params)
      @item.item_image.retrieve_from_cache!(params[:cache][:item_image])
    else
      @item = current_user.selling_items.new
    end
  end

  def create
    @item = current_user.selling_items.new(item_params)
    @item.item_image.retrieve_from_cache!(params[:cache][:item_image])
    if @item.save
      redirect_to items_path, notice: '出品しました'
    else
      render 'new'
    end
  end

  def show
    if user_signed_in?
      @favorite = current_user.favorites.find_by(item_id: @item.id)
      @comment = @item.comments.new
      @comments = @item.comments
    end
  end

  def edit
    if params[:back]
      @item_image = Item.find(params[:id])
      @item = Item.new(item_params)
    else
      set_item
    end
  end

  def update
    @item.item_image.retrieve_from_cache!(params[:cache][:item_image])
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
    @item = current_user.selling_items.new(item_params)
    render 'new' if @item.invalid?
  end

  def buy_confirm
    @trensaction = Transaction.new
  end

  def buy_complete
    @item.buyer_id = current_user.id
    @item.state = true
    if @item.save
      TransactionMailer.complete_mail(@item.seller, @item.buyer).deliver
      @transaction = Transaction.find_by(item_id: params[:id]).destroy
      redirect_to items_path, notice: '受取完了しました'
    else
      render 'transactions/new'
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name,
      :item_image,
      :item_image_cache,
      :price,
      :item_content
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_current_user_producer_nil?
    if current_user.producer.nil?
      redirect_to user_path(current_user),
                  notice: '生産者情報を登録してから出品してください'
    end
  end

  def check_item_state
    set_item
    if @item.state == true
      redirect_to sold_items_user_path(current_user.id),
                  notice: '売却済の商品は編集できません'
    end
  end
end
