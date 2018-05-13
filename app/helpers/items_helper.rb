module ItemsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_items_path
    elsif action_name == 'edit'
      confirm_item_path(params[:id])
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
end
