class OrdersController < ApplicationController
    def view_orders
        render 'add_order.html'
    end

    def create_orders
        @order = Order.new
        @order.rest_name = params[:rest_name]
        @order.order_for = params[:order_for]
        @order.status = "waiting"
        @order.user =  current_user

        @order.save
        redirect_to action: "view_all"
        puts "hereeee"
        puts @order
    end 
    def view_all
        puts "viiiiiiiiewwwww"

        @orders = Order.where(:user_id => current_user.id)
    end
    def finish
        puts "finnnnnnishhhhhh"
        order=Order.find(params[:id])
        order.update_attribute(:status, "finished")
        redirect_to action: "view_all" 

    end
    def cancel
    
        Order.find(params[:id]).destroy
        redirect_to action: "view_all" 

    end
    def addFriendGroup
        params[:friends]
        redirect_to action: "view_orders"

    end
end


