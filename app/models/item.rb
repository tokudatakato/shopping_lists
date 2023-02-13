class Item < ApplicationRecord
    has_many_attached :image
    
    has_many :item_recipe_maps, dependent: :destroy
    belongs_to :category
    belongs_to :list_item
end
