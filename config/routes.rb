Surveytesting::Application.routes.draw do

  resources :answers

  devise_for :users
  root 'home#index'
  get "home/index"

  resources :results

  resources :surveys do
    collection do 
      get "my_surveys"
      post "make_survey_save"
      get "check_survey_email"
    end
    member do
      get "add_answer"
      get "make_survey"
      get "result"
    end
  end

  resources :categories


end
