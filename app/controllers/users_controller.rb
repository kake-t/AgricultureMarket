# users
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @producer = @user.producer
  end
end
