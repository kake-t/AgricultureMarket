class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show destroy]

  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      #メール送信
      redirect_to @transaction
    else
      render 'items/buy_confirm'
    end
  end

  def show; end

  def index
    @transactions = current_user.transactions
  end

  def destroy
    @transaction.destroy
    #メール送信
    redirect_to user_path(current_user.id), notice: '購入キャンセルしました'
  end

  private

  def transaction_params
    params.require(:transaction).permit(:item_id, :user_id)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
