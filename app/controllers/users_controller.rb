class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show buy_history selling_items sold_items]

  def show
    @producer = @user.producer
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
