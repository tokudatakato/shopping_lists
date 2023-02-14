class Public::ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    @list.save
    flash.now[:danger]=@list.errors.full_messages.join
    redirect_to lists_path
  end
  
  def destory
    @list = List.destory
  end
  
  private
  def list_params
    params.require(:list).permit(:list_name, :customer_id, :list_item_id)
  end
end
