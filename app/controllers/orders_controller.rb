class OrdersController < ApplicationController
    def view_orders
        render 'add_order.html'
    end

    def create_orders
        @order = Order.new
        @order.order_for = 
        @order.rest_name = 
        @order.
    end
end


