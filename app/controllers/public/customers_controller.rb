class Public::CustomersController < ApplicationController
    
    def index
        @customer = Customer.all
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

    def destroy
        @customer = current_customer
        @customer.destroy
        redirect_to recipes_path
        # リダイレクト先要検討
    end

    def confirm
    end
        
    private
        def customer_params
            params.require(:customer).permit(:nickname, :shopping_list_id, :comment_id, :like_id, :email, :profile)
        end
end
