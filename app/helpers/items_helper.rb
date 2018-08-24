module ItemsHelper
  def choose_url_new_or_edit
    if action_name == 'new' || (action_name == 'confirm' && params[:p] == '')
      confirm_items_path
    elsif action_name == 'edit' || params[:p] == 'p'
      confirm_item_path(params[:id])
    end
  end

  def choose_method_new_or_edit
    if action_name == 'new' || (action_name == 'confirm' && params[:p] == '')
      :post
    elsif action_name == 'edit' || params[:p] == 'p'
      :patch
    end
  end

  def choose_post_or_pacth
    if request.patch?
      :patch
    else
      :post
    end
  end

  def choose_create_or_update
    if request.patch?
      item_path(params[:id])
    else
      items_path
    end
  end

  def back_new_or_edit
    if request.post?
      new_item_path
    elsif request.patch?
      edit_item_path(params[:id])
    end
  end

  def skip_actions
    action_name == 'buy_history' || action_name == 'sold_items'
  end

  def are_you_buyer?(item)
    if item.buyer.nil?
      false
    else
      current_user.id == item.buyer.id
    end
  end
end
