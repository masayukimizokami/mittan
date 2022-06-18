Rails.application.routes.draw do
  resources:user
  get 'lesson/hello'
  get 'lesson/good'
  root 'user#create'
end
