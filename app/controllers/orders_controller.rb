class OrdersController < ApplicationController
    def view_all
        @orders = Order.where(:user_id => current_user.id)
    end
    def finish
    end
    def cancel()
        p "thhhhhis isss idddd"
        puts params
        Order.find(params[:id]).destroy
        redirect_to action: "view_all" 

    end
end
