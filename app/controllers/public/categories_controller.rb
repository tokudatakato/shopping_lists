class Public::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
       
      # category_idと紐づく投稿を取得
    @items = @category.items.order(created_at: :desc).all
  end
  
  private
    def category_params
      params.require(:category).permit(:category_name)
    end
end
