class Public::HashtagsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @label = params[:label_name]
    hashtag = Hashtag.find_by(label: @label)
    if hashtag.nil?
      redirect_to recipes_path, alert: "##{@label}のタグがついた投稿は存在しません"
    else
      @recipes = hashtag.recipes.includes(:customer, :likes, :comments).recent
    end
  end
end
