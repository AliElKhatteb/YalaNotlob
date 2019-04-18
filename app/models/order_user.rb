class OrderUser < ApplicationRecord
  belongs_to :order
  belongs_to :user
  has_many :orders, :dependent => :delete_all
  has_many :users, :dependent => :delete_all

  acts_as_notifiable :users,
  targets: ->(order, key) {
    ([order.user] + order.user.commented_users.to_a - [order.user]).uniq
  },
  notifiable_path: :_notifiable_path
   def order_notifiable_path
    order_path(order)
  end

  # after_create_commit { create_event }
  # def create_event()
  # 	@orderid = Order.last.id
  # 	@users = OrderUser.user_id.where(order_id: @orderid})
  # 	@users.each  do |user|
  #   	@event = Event.create message: "A new order has been created", user_id: user.id
	# end
  #end



end
