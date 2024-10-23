class QuizSubmissionsController < ApplicationController
  before_action :find_quiz_submission, only: [:show]

  def show
    @quizz = @quiz_submission.quizz
  end


  def create
    @quizz = Quizz.find(params[:quizz_id])
    user_answers = {}
    correct_answers = 0

    params.each do |key, value|
      if key.start_with?('question_')
        question_id = key.split('_').last.to_i
        selected_answer = value.to_i
        user_answers[question_id] = selected_answer
        question = Question.find(question_id)

        if question.correct_answer == selected_answer
          correct_answers += 1
        end
      end
    end

    score = (correct_answers.to_f / @quizz.questions.count) * 100
    quiz_submission = QuizSubmission.create(quiz_id: @quizz.id, user_id: current_user.id, scores: score, user_answers: user_answers)

    redirect_to "/quizzs/#{@quizz.id}/quiz_submissions/#{quiz_submission.id}"
  end


  private

  def find_quiz_submission
    @quiz_submission = QuizSubmission.find(params[:id])
  end

  def quiz_submission_params
    params.require(:quiz_submission).permit(:quizz_id, :user_id, :score, user_answers: {})
  end
end
