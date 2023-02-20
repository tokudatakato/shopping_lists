class Item < ApplicationRecord
  has_one_attached :item_image
  
  has_many :item_recipe_maps, dependent: :destroy
  has_many :list_items
  has_many :lists, through: :list_items
  belongs_to :category
  
  def self.search(keyword)
    where(["item_name like? OR description like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
