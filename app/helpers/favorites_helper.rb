module FavoritesHelper
  def signed_in_true_or_false
    if user_signed_in?
      true
    else
      false
    end
  end
end
