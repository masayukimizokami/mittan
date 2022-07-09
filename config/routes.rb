Rails.application.routes.draw do
  get 'weathers/index'
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
