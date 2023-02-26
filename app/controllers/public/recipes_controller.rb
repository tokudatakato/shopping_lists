class Public::RecipesController < ApplicationController
  before_action :authenticate_customer!
  
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
        if @recipe.save
          redirect_to recipes_path, notice: 'レシピを作成しました'
        else
          flash[:alert] = "レシピタイトルまたはレシピ説明を埋めてください"
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
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe.id), notice: 'レシピを更新しました'
    end
    
    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path, notice: 'レシピを削除しました'
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