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
    if @item.save
      redirect_to admin_items_path, notice: '商品を作成しました'
    else
      flash[:alert] = "項目を埋めてください"
      render :new
    end
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
    flash[:notice] = "登録情報を変更しました"
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
