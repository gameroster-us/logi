class RemoveReferenceFromCatgory < ActiveRecord::Migration[7.0]
  def change
    remove_reference :categories, :product, foreign_key: true
  end
end
