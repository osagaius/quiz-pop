class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :difficulty
      t.string :text
      t.string :correct_answer
      t.string :wrong_answer_1
      t.string :wrong_answer_2
      t.string :wrong_answer_3

      t.timestamps null: false
    end
  end
end
