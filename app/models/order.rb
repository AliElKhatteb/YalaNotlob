class Order < ApplicationRecord
  belongs_to :user 
  has_many :items, :dependent => :delete_all
  has_many :order_users, :dependent => :delete_all



  validates :rest_name, :presence => true
  

  # has_many :users
  has_many :groups

  has_one_attached :menu
 

    acts_as_notifiable :users,
    targets: ->(order, key ) {
        if key == "you invited to "
            [User.find(order.usernotify)]
        end
} ,notifiable_path: :order_notifiable_path 


 def order_notifiable_path   
  order_items_path(id)
        #orders_display_notification_path(id)
end
  


end



