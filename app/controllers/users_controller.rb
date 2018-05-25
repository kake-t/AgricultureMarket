# users
class UsersController < ApplicationController
  before_action :set_user, only: %i[buy_history selling_items sold_items]
  def show
    @user = User.find(params[:id])
    @producer = @user.producer
  end

  def buy_history; end

  def selling_items; end

  def sold_items; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
