class Public::ListItemsController < ApplicationController
  def new
    @list_item = ListItem.new
  end
end
