class QuizSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :quizz, foreign_key: 'quiz_id'

  after_initialize :init

  def init
    self.user_answers ||= {}
  end
end
