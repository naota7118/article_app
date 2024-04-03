Rails.application.routes.draw do
  root "static_pages#home"
  resources :users
  get "static_pages/home"
  get 'static_pages/create'
  get 'static_pages/article'
end
