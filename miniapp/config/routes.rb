Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'
  get  'miniapp/new' => 'articles#new'
  post 'miniapp'     => 'articles#create'
end 
