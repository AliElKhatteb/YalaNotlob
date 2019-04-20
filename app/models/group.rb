class Group < ApplicationRecord
  belongs_to :user
  has_many :groups_members, :dependent => :delete_all
  has_many :users , through: :groups_members , :dependent => :delete_all
end
