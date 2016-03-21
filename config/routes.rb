Rails.application.routes.draw do
  resources :categories
  devise_for :users
  
  get 'wellcome/index'

  root 'wellcome#index'

  resources :articles do
    resources :comments
  end
end
