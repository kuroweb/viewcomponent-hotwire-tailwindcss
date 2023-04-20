Rails.application.routes.draw do
  devise_for :users

  resources :tasks, only: %i[index create update destroy]

  root to: redirect("/tasks")
end
