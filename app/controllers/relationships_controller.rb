class RelationshipsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.following
  end

  def create
    @user = User.find(params[:user_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to user_path(params[:user_id])
  end
end
