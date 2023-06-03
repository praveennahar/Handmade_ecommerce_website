class Customer::OrdersController < ApplicationController
    def new
        @cart = Cart.find(params[:cart_id])
        @order = Order.new
        @total = params[:total_price]
    end

    def create
        @order = current_account.orders.new(order_params)
        # @order[:total] = params[:order_id][:total].to_f
        if @order.save
            redirect_to customer_checkouts_path
        else 
            render :show,status: :unprocessable_entity
        end
    end

    private
    def order_params
        params.require(:order).permit(:name, :email, :address, :number, :total)

    end
end
