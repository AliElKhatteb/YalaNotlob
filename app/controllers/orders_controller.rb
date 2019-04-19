class OrdersController < ApplicationController
    def new
         @users=["sss","sss","sddd"]
        @friends =Friendship.where(user_id:current_user.id)
       @groups = Group.where(user:current_user)
       
       @order=Order.new
    end
    def saveFriendsGroups(order,friends)
        puts "inside saving"

        arrFriends=friends.split(',')
        puts arrFriends 
 
        x = 1
        arrFriends.each do |friend|
            @usr = User.where(email:friend)
            puts @usr[0].id
            @order_user =OrderUser.new
            @order_user.order = order
            @order_user.user = @usr[0]
            @order_user.state = "invited"
            @order_user.save
            x += 1
        end
       

        


    #  redirect_to  orders_path 


    end


    # def show
    #     # @orders = Order.where(:user => current_user)


    #     @items = Item.where(:order_id => params[:id])
    #        #note::check if select return null  render the page with empty array
    #     #catch error of null
    # end

    def create
        puts "cccreaaate"
        puts params[:all]
        @order_user=OrderUser.new
        @order_user.user= current_user
        @order_user.order 
        
        #add the fiends or groups to table order_user
        @order = Order.new
        @order.rest_name = params[:rest_name]
        @order.order_for = params[:order_for]
        @order.status = "waiting"
        @order.user =  current_user 

        if @order.save
            
            saveFriendsGroups(@order,params[:all])
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


