class TransactionsController < ApplicationController
  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      #メール送信
      redirect_to @transaction
    else
      render 'items/buy_confirm'
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def index
    @transactions = current_user.transactions
  end

  private

  def transaction_params
    params.require(:transaction).permit(:item_id, :user_id)
  end
end
