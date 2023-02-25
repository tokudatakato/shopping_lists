class Admin::RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
    end
    
    def index
        @recipes = Recipe.all
        # @recipes = Recipe.page(params[:page]).per(10)
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.customer_id = current_customer.id
        @recipe.save
        if @recipe.save
          flash[:success] = "作成しました"
          redirect_to admin_recipes_path
          # redirect_to recipe_path(@recipe.id)
        else
          render :new
        end
    end
    
    def show
        @recipe = Recipe.find(params[:id])
        @like = Like.new
        @comment = Comment.new
        @comments = @recipe.comments
    end
    
    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(item_params)
        flash[:notice] = "レシピの更新に成功"
        redirect_to admin_recipe_path(@recipe.id)
    end
    
    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        flash[:success] = "レシピを削除しました"
        redirect_to admin_recipes_path
    end
    
    def search
      @recipes = Recipe.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end
    
    private
    
    def recipe_params
        params.require(:recipe).permit(:customer_id, :comment_id, :like_id,  :title, :body, images: [])
    end
    
end
