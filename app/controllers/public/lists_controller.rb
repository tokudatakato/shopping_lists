class Public::ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end
  
  def destory
    @list = List.destory
  end
  
  private
  def list_params
    params.require(:list).permit(:list_name)
  end
end
