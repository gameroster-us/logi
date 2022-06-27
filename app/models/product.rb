class Product < ApplicationRecord
  validates :name, presence: true
  belongs_to :category, optional: true
  has_one_attached :image
end
