Rails.application.routes.draw do
  
  #root設定
  root :to => 'homes#index'
  get 'homes/index'
  #get 'books/index'
  #get 'books/show'
  #get 'books/new'
  #get 'books/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
end
