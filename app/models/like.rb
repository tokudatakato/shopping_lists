class Like < ApplicationRecord
  # 一人が一つのレシピに対して、一つのいいね
  validates_uniqueness_of :recipe_id, scope: :customer_id
  
  belongs_to :customer
  belongs_to :recipe
  
  def liked_by?(recipe_id)
    likes.where(recipe_id: recipe_id).exists?
  end
end
