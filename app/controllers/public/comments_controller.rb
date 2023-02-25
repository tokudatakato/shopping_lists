class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @recipe = @comment.recipe
    @comments = @recipe.comments
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash.now[:alert] = '投稿を削除しました'
    @recipe = Recipe.find(params[:recipe_id]) 
    render :recipe_comments
  end

  private
    def comment_params
      params.require(:comment).permit(:recipe_id, :content, :customer_id)
    end
end
