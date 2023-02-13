class Recipe < ApplicationRecord
    has_many_attached :image
    
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :tag_maps, dependent: :destroy
    has_many :item_recipe_maps, dependent: :destroy
    belongs_to :customer
    # アソシエーションを記載するとレシピを新規作成しても表示されない
end
