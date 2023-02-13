class List < ApplicationRecord
  belongs_to :customer
  has_many :lists, through: :list_items
end
