class Public::LikesController < ApplicationController
  before_action :authenticate_customer!, only: [:create, :destroy]

  def create
    @recipe = Recipe.find(params[:recipe_id])
    recipe = Recipe.find(params[:recipe_id])
    like = current_customer.likes.new(recipe_id: recipe.id)
    like.save
    # 通知の作成
    @recipe.create_notification_like(current_user)
    # redirect_to request.referer
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    recipe = Recipe.find(params[:recipe_id])
    like = current_customer.likes.find_by(recipe_id: recipe.id)
    like.destroy
    # redirect_to request.referer
  end

end
