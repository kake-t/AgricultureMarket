class TransactionMailer < ApplicationMailer
  def buyer_mail(user)
    @user = user
    mail to: @user.email, subject: '購入申請完了のメール'
  end

  def seller_mail(user)
    @user = user
    mail to: @user.email, subject: '購入申請受付のメール'
  end

  def buy_cancel(user)
    @user = user
    mail to: @user.email, subject: '購入キャンセルのお知らせ'
  end
end
