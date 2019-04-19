class Order < ApplicationRecord
  belongs_to :user 
  has_many :items, :dependent => :delete_all


  # has_many :users
  has_many :groups

 

    acts_as_notifiable :users,
    targets: ->(order, key ) {
        if key == "you invited to order"
            [User.find(order.usernotify)]
        else
            puts "wrong"
        end
},notifiable_path: :order_notifiable_path 


 def order_notifiable_path    
        order_display_notification_path(id)
end
  


end
