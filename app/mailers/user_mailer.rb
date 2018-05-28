class UserMailer < ApplicationMailer
  def buyer_mail(user)
    @user = user
  end

  def seller_mail(user)
    @user = user
  end
end
