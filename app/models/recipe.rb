class Recipe < ApplicationRecord
    has_many_attached :images
    
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :tag_maps, dependent: :destroy
    has_many :item_recipe_maps, dependent: :destroy
    belongs_to :customer
    
    # いいね機能
    has_many :likes, dependent: :destroy
    
    # いいね判定メソッド
    def liked_by?(customer)
        likes.where(customer_id: customer.id).exists?
    end
end
