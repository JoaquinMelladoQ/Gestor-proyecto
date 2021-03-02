Rails.application.routes.draw do
  post 'project/create'
  get 'project/dashboard'
  get 'project/index'
  root 'project#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
