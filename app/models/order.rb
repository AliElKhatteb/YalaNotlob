class Order < ApplicationRecord
  belongs_to :user 
  has_many  :items

  has_many :users
  has_many :groups
end
