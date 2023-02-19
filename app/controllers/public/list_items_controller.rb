class Public::ListItemsController < ApplicationController
  def new
    @list_item = ListItem.new
  end
  
  def destroy
    # @list = List.find(params[:id])
    # @list_item = List.items.all
    # if @list_item.destroy
    #   redirect_to list_path(params[:id])
    # else
    #   redirect_to list_path(params[:id])
    # end
  end
end
