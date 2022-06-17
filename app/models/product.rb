class Product < ApplicationRecord
  validates :name, presence: true
  has_many :categories
  has_one_attached :image
end
