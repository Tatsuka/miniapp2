Rails.application.routes.draw do
  devise_for :users

  root   'topics#index'
  get    'miniapp'          => 'topics#index'
  get    'topics/new'       => 'topics#new'
  post   'miniapp'          => 'topics#create'
  delete 'topics/:id'       => 'topics#destroy'
  patch  'topics/:id'       => 'topics#update'
  get    'topics/:id/edit'  => 'topics#edit'
  get    'topics'           => 'topics#show'
end
