class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
        @recipes = @customer.recipes
    end

    def destory
        @customer = customer.find(params[:id])
        @customer.destory
        redirect_to admin_customers_path
    end
end
