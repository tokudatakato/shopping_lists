class Admin::ItemsController < ApplicationController
  def index
    # urlにcategory_id(params)がある場合
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
       
      # category_idと紐づく投稿を取得
      @items = @category.items.all
      @list_item = ListItem.new
    else
      # 投稿すべてを取得
      @items = Item.all
    end
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    flash[:notice] = "アイテムの更新は成功したよ🙃"
    redirect_to admin_item_path(@item.id)
  end
  
  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  
  private
    def item_params
      params.require(:item).permit(:item_image, :category_id, :item_name, :description, :price, :is_stock)
    end
end
