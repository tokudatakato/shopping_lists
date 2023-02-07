class Admin::RecipesController < ApplicationController
     def new
        @recipe = Recipe.new
    end
    
    def index
        @recipes = Recipe.page(params[:page]).per(10)
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.save
        redirect_to recipe_path(@recipe.id)
    end
    
    def show
        @recipe = Recipe.find(params[:id])
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
        @recipe = Recipe.destroy
    end
    
    private
    
    def recipe_params
        params.require(:recipe).permit(:title, :body, image: [])
    end
    
end
