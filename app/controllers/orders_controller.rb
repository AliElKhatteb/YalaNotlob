class OrdersController < ApplicationController
    def view_all
        @orders = Order.where(:user_id => current_user.id)
    end
    def finish
        order=Order.find(params[:id])
        order.update_attribute(:status, "finished")
        redirect_to action: "view_all" 

    end
    def cancel()
    
        Order.find(params[:id]).destroy
        redirect_to action: "view_all" 

    end
end
