class UserMailer < ApplicationMailer
  def buyer_mail(user)
    @user = user
    mail to: @user.email, subject: '購入申請完了のメール'
  end

  def seller_mail(user)
    @user = user
    mail to: @user.email, subject: '購入申請受付のメール'
  end
end
