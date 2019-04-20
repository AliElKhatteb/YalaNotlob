class OrdersController < ApplicationController
    def new
        @users=["sss","sss","sddd"]
        @friends =Friendship.where(user_id:current_user.id)
        @groups = Group.where(user:current_user)
       
       @order=Order.new
    end
    def saveFriendsGroups(order,friends)

        arrFriends=friends.split(',')
 
        x = 1
        arrFriends.each do |friend|
            @usr = User.where(email:friend)
            @order_user =OrderUser.new
            @order_user.order = order
            @order_user.user = @usr[0]
            @order_user.state = "invited"
            @order_user.save
            x += 1
            if @order_user.save
                @order.usernotify=@order_user.user_id.to_s
                @order.notify :users, key: "you invited to " , parameters: { :order_id => @order[:id] , :restaurant => @order[:rest_name] , :sender => current_user.email }
            end 
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
            @order.menu.attach(params[:menu])
            saveFriendsGroups(@order,params[:all])
            redirect_to  orders_path 
          else
            render 'new'
          end
         
    end 
    def index

        @orders = Order.where(:user => current_user)
    end
    def update
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

    def display_notification
        @order = Order.find(params[:format])
        @order_users=Orderuser.where(order_id: params[:format], user_id: current_user.id) 
        redirect_to :controller => 'items' , :action => 'index' , :id => params[:format]
    end


end

