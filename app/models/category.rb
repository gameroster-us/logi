class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :product, optional: true
  has_ancestry
  before_validation do
    self.ancestry = nil if self.ancestry.blank?
  end
end
