class OrdersController < ApplicationController
    def new
         @users=["sss","sss","sddd"]
        @friends =Friendship.where(user_id:current_user.id)
       @groups = Group.where(user:current_user)
       
       @order=Order.new
    end
    def viewaddedusers
        @users=["nada","yasmin","arwa"]
        redirect_to 
    end
    # def show
    #     # @orders = Order.where(:user => current_user)


    #     @items = Item.where(:order_id => params[:id])
    #        #note::check if select return null  render the page with empty array
    #     #catch error of null
    # end

    def create
        @order = Order.new
        @order.rest_name = params[:rest_name]
        @order.order_for = params[:order_for]
        @order.status = "waiting"
        @order.user =  current_user 

        if @order.save
            redirect_to  orders_path 
          else
            render 'new'
          end
         
    end 
    def index
        puts "viiiiiiiiewwwww"

        @orders = Order.where(:user => current_user)
    end
    def update
        puts "finnnnnnishhhhhh"
        order=Order.find(params[:id])
        order.update_attribute(:status, "finished")
        redirect_to orders_path

    end
    def destroy
    
        Order.find(params[:id]).destroy
        redirect_to orders_path

    end
    def addFriendGroup
        params[:friends]
        redirect_to new_order_path

    end
end


