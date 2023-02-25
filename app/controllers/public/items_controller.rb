class Public::ItemsController < ApplicationController
  def index
    # urlにcategory_id(params)がある場合
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
       
      # category_idと紐づく投稿を取得
      @items = @category.items.order(created_at: :desc).all
      @list_item = ListItem.new
    else
      # 投稿すべてを取得
      @items = Item.order(created_at: :desc).all
      @list_item = ListItem.new
      @customer = current_customer
      @lists = @customer.lists.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @list_item = ListItem.new
  end
  
  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  
private
  def item_params
    params.require(:item).permit(:image, :category_id, :item_name, :description, :price, :is_stock)
  end
end
