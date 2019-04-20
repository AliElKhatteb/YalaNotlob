class OrderUser < ApplicationRecord
  belongs_to :order
  belongs_to :user
  # has_many :orders, :dependent => :delete_all
  # has_many :users, :dependent => :delete_all



 



end
