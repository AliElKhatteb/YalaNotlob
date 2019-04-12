class ItemsController < ApplicationController
    def view_items
        @items = Item.where(:order_id => params[:id])
        if @item 
    end
    def create_item
        
        @item = Item.new
        @item.item_name = params[:name]
        @item.item_amount = params[:amount]
        @item.price = params[:price]
        @item.comment = params[:comment]
        @item.user = current_user;
        @item.order_id= params[:id]
       if @item.save
        redirect_to action: "view_items", id: params[:id]
           else
        render 'view_items'

       end
     

   
    end


    # private
    #     def items_params
    #       params.require(:item).permit(:item_name, :amout_name, :price,:comment)
    #     end
end
end
