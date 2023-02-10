class Recipe < ApplicationRecord
    has_many_attached :image
    
    has_many :likes
    has_many :comments
    has_many :tag_maps
    has_many :item_recipe_maps
    belongs_to :customer
    # アソシエーションを記載するとレシピを新規作成しても表示されない
end
