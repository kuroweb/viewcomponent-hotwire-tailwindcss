Rails.application.routes.draw do
  devise_for :users

  resources :tasks, only: %i[index show edit create update destroy]

  root to: redirect("/tasks")
end
