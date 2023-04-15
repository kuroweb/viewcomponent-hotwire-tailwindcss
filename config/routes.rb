Rails.application.routes.draw do
  devise_for :users

  resources :tasks, only: %i[index]

  root to: redirect("/tasks")
end
