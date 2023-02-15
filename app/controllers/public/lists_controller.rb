class Public::ListsController < ApplicationController
  def index
    @lists = current_customer.lists
    @list = List.new
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def create
    @list = List.new(list_params)
    @list.save
    flash.now[:danger]=@list.errors.full_messages.join
    redirect_to lists_path
  end
  
  def destory
    @list = List.find(params[:id])
    @list.destory
  end
  
  private
  def list_params
    params.require(:list).permit(:list_name, :customer_id, :list_item_id)
  end
end
