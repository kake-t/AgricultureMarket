class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @item }
        format.js { render 'comments/index' }
      else
        format.html { render 'items/show' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id]) }
      format.js { render 'comments/index' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :item_id, :content)
  end
end
