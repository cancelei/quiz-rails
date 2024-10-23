class FixQuizSubmissionsForeignKey < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :quiz_submissions, :quizzes
    add_foreign_key :quiz_submissions, :quizzs, column: :quiz_id
  end
end
