class AddCategoryToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :category, index: true
    add_foreign_key :questions, :categories
  end
end
