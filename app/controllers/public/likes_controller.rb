class Public::LikesController < ApplicationController
  before_action :authenticate_customer!, only: [:create, :destroy]

   before_action :recipe_params

  def create
    @recipe_like = Like.new(customer_id: current_customer.id, recipe_id: params[:recipe_id])
    @recipe_like.save
  end

  def destroy
    @recipe_like = Like.find_by(customer_id: current_customer.id, recipe_id: params[:recipe_id])
    @recipe_like.destroy
  end

  private

  def recipe_params
    @recipe = Recipe.find(params[:recipe_id])
  end
end
