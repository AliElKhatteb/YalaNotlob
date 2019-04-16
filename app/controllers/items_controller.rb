class ItemsController < ApplicationController
    def index
        @items = Item.where(order_id: params[:order_id])
        #note::check if select return null  render the page with empty array
        #catch error of null
    end
    def create
        @item = Item.new
        @item.item_name = params[:name]
        @item.item_amount = params[:amount]
        @item.price = params[:price]
        @item.comment = params[:comment]
        @item.user = current_user;
        @item.order_id= params[:order_id]
        
       if @item.save
        ##note: if user don't enter name or amount or price>>don'y save
        redirect_to order_items_path, id: params[:id]
           else
            #it give err of not saved weher items in views be empty
        render 'index'
        @user_order = UserOrder.new
        @user_order.user= current_user
        @user_order.order= params[:order_id]
        @user_order.save
        puts @user_order 
        puts usssser_order
       end
     

   
    end


    # private
    #     def items_params
    #       params.require(:item).permit(:item_name, :amout_name, :price,:comment)
    #     end
end

