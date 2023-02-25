class Public::ListItemsController < ApplicationController
  
  def create
    @list_item = ListItem.new(list_item_params)
    @list_item.save
    redirect_to items_path, notice: 'リストに追加しました'
  end
  
  def destroy
    @list = List.find(params[:list_id])
    @list_item = ListItem.find(params[:id])
    @list_item.destroy
    redirect_to list_path(@list), notice: '商品が削除しました'
  end
  
  def destroy_all
    @list = List.find(params[:list_id])
    @list.list_items.destroy_all
    redirect_to list_path(@list), notice: '商品がすべて削除しました' 
  end
  
  
  def list_item_params
    params.require(:list_item).permit(:list_id, :item_id)
  end
end


