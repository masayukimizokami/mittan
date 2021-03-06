Rails.application.routes.draw do
  resources :pigs
  resources :pens
  resources :apples
  resources :cats
  resources :dogs do
    collection do
      get 'food'
      get 'walk'
      get 'snack'
    end
  end
  resources :scores
  resources :points
  resources :dogruns
  resources :families
  resources :cooks do
    collection do
      get 'search'
      get 'top'
    end
  end
  resources:user
  get 'lesson/hello'
  get 'lesson/good'
  root 'cooks#index'
end
