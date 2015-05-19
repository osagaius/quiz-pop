class AddCategoryToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :category, :integer
  end
end
