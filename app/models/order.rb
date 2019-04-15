class Order < ApplicationRecord
  belongs_to :user 
  has_many :items, :dependent => :delete_all


  # has_many :users
  has_many :groups

end
