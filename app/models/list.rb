class List < ApplicationRecord
  
  validates :list_name, presence: true
  
  belongs_to :customer
  has_many :list_items
  has_many :items, through: :list_items
end
