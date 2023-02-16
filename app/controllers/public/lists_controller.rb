class Public::ListsController < ApplicationController
  def index
    @lists = current_customer.lists
    @list = List.new
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def create
    @list_item = ListItem.new(list_params)
    @list_item.save
    flash.now[:danger]=@list_item.errors.full_messages.join
    redirect_to lists_path
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
  end
  
  private
  def list_params
    params.require(:list_item).permit(:list_id, :item_id)
  end
end
