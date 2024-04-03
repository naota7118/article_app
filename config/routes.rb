Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/home"
  get 'static_pages/create'
  get 'static_pages/article'
  resources :users
end
