class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
      render :recipe_comments
    else
      render 'recipes/show'
    end
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
      params.require(:comment).permit(:comment_id, :recipe_id, :content, :star, :customer_id)
    end
end
