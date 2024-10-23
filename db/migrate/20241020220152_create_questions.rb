class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.references :quizz, null: false, foreign_key: true
      t.text :content
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.integer :correct_answer

      t.timestamps
    end
  end
end
