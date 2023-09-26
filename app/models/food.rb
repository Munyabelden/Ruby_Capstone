class Food < ApplicationRecord
  belongs_to :recipes

  validates :name, presence: true
  validates :quantity, presence: true
end
