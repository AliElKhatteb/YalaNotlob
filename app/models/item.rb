class Item < ApplicationRecord
   belongs_to :order
  belongs_to :user

  validates :item_name, :presence => true
  validates :item_amount, :presence => true
  validates :price, :presence => true
end
