class Item < ApplicationRecord
    has_many_attached :image
    
    has_many :item_recipe_maps, dependent: :destroy
    has_many :lists, through: :list_items
    has_many :list_items
    belongs_to :category
end
