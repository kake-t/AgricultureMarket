# items
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[top index show]
  before_action :set_item, only: %i[show update destroy buy_confirm buy_complete]
  before_action :check_current_user_producer_nil?, only: [:new]
  before_action :check_item_state, only: [:edit]

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
      render :new
    end
  end

  def show
    if user_signed_in?
      @transaction = @item.transactions.first
      @favorite = current_user.favorites.find_by(item_id: @item.id)
      @comment = @item.comments.new
      @comments = @item.comments
    end
  end

  def edit
    @patch = :p
    if @item.seller_id == current_user.id
      if params[:back]
        @item_image = Item.find(params[:id])
        @item = Item.new(item_params)
      else
        set_item
      end
    else
      redirect_to @item, notice: '権限がありません'
    end
  end

  def update
    @item.item_image.retrieve_from_cache!(params[:cache][:item_image])
    if @item.seller_id == current_user.id
      if @item.update(item_params)
        redirect_to items_path, notice: '編集しました'
      else
        render :edit
      end
    else
      redirect_to @item, notice: '権限がありません'
    end
  end

  def destroy
    if @item.seller_id == current_user.id
      @item.destroy
      redirect_to items_path, notice: '削除しました'
    else
      redirect_to @item, notice: '権限がありません'
    end
  end

  def confirm
    @item = current_user.selling_items.new(item_params)
    if @item.invalid?
      if params[:p] == 'p'
        @patch = :p
        render :edit
      else
        render :new
      end
    end
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
