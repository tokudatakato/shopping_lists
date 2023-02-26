class Admin::CustomersController < ApplicationController
    
    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
        @recipes = @customer.recipes
    end

    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to admin_customers_path, alert: 'ユーザーを削除しました'
    end
    
    def likes
        @customer = Customer.find(params[:id])
        likes= Like.where(customer_id: @customer.id).pluck(:recipe_id)
        @like_recipes = Recipe.find(likes)
    end
end
