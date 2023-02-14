class Public::RecipesController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :edit, :update, :destroy]
  
    def new
        @recipe = Recipe.new
    end
    
    def index
        @recipes = Recipe.all
        # @recipes = Recipe.page(params[:page]).per(10)
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
          flash[:success] = "作成しました"
          redirect_to recipes_path
          # redirect_to recipe_path(@recipe.id)
        else
          render :new
        end
    end
    
    def show
        @recipe = Recipe.find(params[:id])
        @like = Like.new
    end
    
    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update!(item_params)
        flash[:notice] = "投稿の更新は成功したよ🙃"
        redirect_to recipe_path(@recipe.id)
    end
    
    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        flash[:success] = "作成しました"
        redirect_to recipes_path
    end
    
    private
    
    def recipe_params
        params.require(:recipe).permit(:customer_id, :comment_id, :like_id,  :title, :body, images: [])
    end
    

end
