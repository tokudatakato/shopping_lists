class Admin::CommentsController < ApplicationController
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_recipe_path(@comment.recipe), alert: 'コメントを削除しました'
  end
end
