json.extract! question, :id, :quizz_id, :content, :answer1, :answer2, :answer3, :answer4, :correct_answer, :created_at, :updated_at
json.url question_url(question, format: :json)
