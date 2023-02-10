class Item < ApplicationRecord
    has_many_attached :image
    
    has_many :item_recipe_maps
    has_many :categories
    belongs_to :list_time
end
