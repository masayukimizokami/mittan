Rails.application.routes.draw do
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
