class OrderUser < ApplicationRecord
  belongs_to :order
  belongs_to :user
  has_many :orders, :dependent => :delete_all
  has_many :users, :dependent => :delete_all



  # after_create_commit { create_event }
  # def create_event()
  # 	@orderid = Order.last.id
  # 	@users = OrderUser.user_id.where(order_id: @orderid})
  # 	@users.each  do |user|
  #   	@event = Event.create message: "A new order has been created", user_id: user.id
	# end
  #end
  acts_as_notifiable :users,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    targets: ->(order, key) {
      ([order.user] + order.OrderUser.users - [order.user]).uniq
    },
    # Path to move when the notification is opened by the target user
    # This is an optional configuration since activity_notification uses polymorphic_path as default
    notifiable_path: :article_notifiable_path

  def article_notifiable_path
    article_path(article)
  end
end



