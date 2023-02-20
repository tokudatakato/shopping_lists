class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
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
  
  private
    def item_params
      params.require(:item).permit(:item_image, :category_id, :item_name, :description, :price, :is_stock)
    end
end
