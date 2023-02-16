class Recipe < ApplicationRecord
    has_many_attached :images
    
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :tag_maps, dependent: :destroy
    has_many :item_recipe_maps, dependent: :destroy
    belongs_to :customer
    
    # いいね機能
    has_many :likes, dependent: :destroy
    
    # タグ機能
    has_many :recipe_taggings, dependent: :destroy
    has_many :hashtags, through: :recipe_taggings

    after_create :generate_hashtag
    scope :recent, -> { order(created_at: :desc) }
    
    # いいね判定メソッド
    def liked_by?(customer)
        likes.where(customer_id: customer.id).exists?
    end
    
    private
    # ハッシュタグの保存
      def generate_hashtag
        recipe_labels = Hashtag.hashtag_scan(body)
        recipe_labels.uniq.each do |word|
          self.hashtags << Hashtag.find_or_create_by(label: Hashtag.pound_delete_at_hashtag(word))
      end
    end
end
