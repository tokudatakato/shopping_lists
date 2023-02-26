class Admin::CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'カテゴリーを作成しました'
    else
      @categories = Category.all
      flash[:alert] = "カテゴリー名を埋めてください"
      render :index
    end
  end
  
  def show
    @category = Category.find(params[:id])
    # category_idと紐づく投稿を取得
    @items = @category.items.order(created_at: :desc).all
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    flash[:notice] = "カテゴリー名を変更しました"
    redirect_to admin_categories_path
  end
  
  private
  def category_params
    params.require(:category).permit(:category_name)
  end

end
