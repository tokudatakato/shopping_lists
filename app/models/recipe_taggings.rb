class PostTagging < ApplicationRecord
    
  belongs_to :recipe
  belongs_to :hashtag
  
  validates :recipe_id, presence: true
  validates :hashtag_id, presence: true
  validates :recipe_id, uniqueness: { scope: :hashtag_id }
end