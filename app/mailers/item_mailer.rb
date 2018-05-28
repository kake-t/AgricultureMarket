class ItemMailer < ApplicationMailer
  def item_mail(item)
    @item = item
  end
end
