class Order < ApplicationRecord
  belongs_to :user 
  has_many :items, :dependent => :delete_all


  # has_many :users
  has_many :groups

 

    acts_as_notifiable :users,
    targets: ->(order, key ) {
        if key == "you invited to "
            [User.find(order.usernotify)]
        end
} ,notifiable_path: :order_notifiable_path 


 def order_notifiable_path    
        order_display_notification_path(id)
end
  


end



# acts_as_notifiable :users,
# targets: ->(order, key ) {
#     if key == "invited you to order from"
#         [User.find(order.invited_users)]
#     elsif key == "finished an order from"  
#         p "order finished send notification to invited users"
#         @ordusers=Orderuser.where(order_id: order.id , status: 1)
#         @invited_users ||= []
#         @ordusers.each do |u|
#             @invited_users << User.find(u.user_id)   
#            end
#         p @invited_users
#         @invited_users
#     elsif key == "cancelled an order from"  
#         [User.find(order.invited_users)]
#     end
# },notifiable_path: :order_notifiable_path
