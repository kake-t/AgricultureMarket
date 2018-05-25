# users
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @producer = @user.producer
  end

  def buy_history
    @user = User.find(params[:id])
  end
end
