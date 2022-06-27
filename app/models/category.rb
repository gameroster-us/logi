class Category < ApplicationRecord
  validates :name, presence: true
  has_many :products
  has_ancestry
  before_validation do
    self.ancestry = nil if self.ancestry.blank?
  end
end
