class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[show destroy]

  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      #メール送信
      TransactionMailer.buyer_mail(current_user).deliver
      TransactionMailer.seller_mail(@transaction.item.seller, @transaction.user).deliver
      redirect_to @transaction
    else
      redirect_to @transaction.item, notice: 'すでに購入申請しています'
    end
  end

  def show; end

  def index
    @transactions = current_user.transactions
  end

  def destroy
    @transaction.destroy
    #メール送信
    TransactionMailer.cancel_mail(current_user, current_user).deliver
    TransactionMailer.cancel_mail(@transaction.item.seller, @transaction.user).deliver
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
