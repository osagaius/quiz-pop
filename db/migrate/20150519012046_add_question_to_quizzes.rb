class AddQuestionToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :question, :integer
  end
end
