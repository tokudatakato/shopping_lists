class Public::CustomersController < ApplicationController
    
    def index
        @customers = Customer.all
        # レシピ投稿をしているユーザーだけを表示させる
    end
    
    def show
        @customer = Customer.find(params[:id])
        @recipes = @customer.recipes
    end

    def edit
        @customer = current_customer
    end

    def update
        @customer = current_customer
        if @customer.update(customer_params)
            flash[:notice] = "ユーザーの編集に成功しました"
            redirect_to customer_path(@customer)
        else
            render:edit
        end
    end

    def confirm
    end
    
    def destory
        @customer = current_customer
        if @customer.destory
            redirect_to　root_path
        else
            render confirm
        end
    end
    
    def likes
        @customer = Customer.find(params[:id])
        likes= Like.where(customer_id: @customer.id).pluck(:recipe_id)
        @like_recipes = Recipe.find(likes)
    end
        
    private
        def customer_params
            params.require(:customer).permit(:nickname, :shopping_list_id, :comment_id, :like_id, :email, :profile, :icon_image)
        end
end
