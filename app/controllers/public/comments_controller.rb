class Public::CommentsController < ApplicationController
  before_action :autheniticate_customer!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @recipe = @comment.recipe
    @comments = @recipe.comments
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @recipe = @comment.recipe
    @comments = @recipe.comments
  end

  private
    def comment_params
      params.require(:comment).permit(:recipe_id, :content, :customer_id)
    end
end
