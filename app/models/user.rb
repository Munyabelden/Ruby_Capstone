class User < ApplicationRecord
  has_many :recipes, class_name: "Recipe", foreign_key: "user_id"

  validates :first_name, presence: true
end
