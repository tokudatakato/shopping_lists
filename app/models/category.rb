class Category < ApplicationRecord
    has_many :items
    
    validates :category_name, presence: true
end
