class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.active_relationships.create!(followed_id: @user.id)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.active_relationships.find_by(followed_id: @user.id).destroy
    redirect_to user_path(params[:user_id])
  end
end
