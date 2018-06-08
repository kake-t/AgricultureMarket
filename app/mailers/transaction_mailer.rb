class TransactionMailer < ApplicationMailer
  def buyer_mail(user)
    @user = user
    mail to: @user.email, subject: '購入申請完了のメール'
  end

  def seller_mail(user, buyer)
    @user = user
    @buyer = buyer
    mail to: @user.email, subject: '購入申請受付のメール'
  end

  def cancel_mail(user, buyer)
    @user = user
    @buyer = buyer
    mail to: @user.email, subject: '購入キャンセルのお知らせ'
  end

  def complete_mail(user, buyer)
    @user = user
    @buyer = buyer
    mail to: @user.email, subject: '受け取り完了のお知らせ'
  end
end
