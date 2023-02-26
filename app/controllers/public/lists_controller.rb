class Public::ListsController < ApplicationController
  before_action :autheniticate_customer!
  
  def index
    @lists = current_customer.lists
    @list = List.new
  end
  
  def show
    @list = List.find(params[:id])
    # @list_items = ListItem.find(list_id = @list.id)
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: 'リストを作成しました'
    else
      @lists = current_customer.lists
      flash[:alert] = "リスト名を埋めてください"
      render :index
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, alert: 'リストを削除しました'
  end
  
  
  def list_params
    params.require(:list).permit(:list_id, :list_name, :customer_id)
  end
end