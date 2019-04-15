class Order < ApplicationRecord
  belongs_to :user 
  has_many :items, :dependent => :delete_all


  has_many :users
  has_many :groups




  after_create_commit { create_event }
  def create_event()
  	


    users=orderuser.where(order_id:params[:order_id])
    
    @event = Event.create message: "msg", user_id: user.id
	
  end

end
