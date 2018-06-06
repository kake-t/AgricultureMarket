class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @item
    else
      render 'items/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to item_path(params[:item_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :item_id, :content)
  end
end
