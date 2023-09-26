class Recipe < ApplicationRecord
  has_many :foods, class_name: 'Food', foreign_key: 'recipe_id'
  belongs_to :user

  validates :title, presence: true
  validates :description
  validates :cooking_time
end
