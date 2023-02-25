class Recipe < ApplicationRecord
  
  validates :title, presence: true
  validates :body, presence: true
  
  has_many_attached :images
  
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_many :tag_maps, dependent: :destroy
  # has_many :item_recipe_maps, dependent: :destroy
  belongs_to :customer
  
  # いいね機能
  has_many :likes, dependent: :destroy
  
  # タグ機能
  has_many :recipe_taggings, dependent: :destroy
  has_many :hashtags, through: :recipe_taggings

  after_create :generate_hashtag
  scope :recent, -> { order(created_at: :desc) }
  
  # コメント機能
  has_many :comments
  
  # いいね判定メソッド
  def liked_by?(customer)
      likes.where(customer_id: customer.id).exists?
  end
  
  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
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
