class List < ApplicationRecord
  belongs_to :customer
  has_many :list_items
  has_many :items, through: :list_items
end
