Rails.application.routes.draw do
  devise_for :users
  resources :quizzs do
    resources :questions, only: [:new, :create]
    resources :quiz_submissions, only: [:show, :create]
  end

  root "quizzs#index"

end
