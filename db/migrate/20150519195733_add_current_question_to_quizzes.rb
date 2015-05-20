class AddCurrentQuestionToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :current_question, :integer
  end
end
