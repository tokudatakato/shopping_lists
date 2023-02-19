class Public::ListsController < ApplicationController
  def index
    @lists = current_customer.lists
    @list = List.new
  end
  
  def show
    @list = List.find(params[:id])
    # @list_items = ListItem.find(list_id = @list.id)
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
  
  # def item_destroy
  #   @list = List.find(params[:id])
  #   @list_item = @list.items.find(params[:list_items_id])
  #   if @list_item.destroy
  #     redirect_to list_path(params[:id])
  #   else
  #     redirect_to list_path(params[:id])
  #   end
  # end
  
  private
  def list_params
    params.require(:list_item).permit(:list_id, :item_id)
  end
end