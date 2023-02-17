class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to recipe_path(@comment.recipe)
  end

  private
    def comment_params
      params.require(:comment).permit(:recipe_id, :content, :star)
    end
end
