Rails.application.routes.draw do

  root to: 'urls#index'
  resources :urls
  get '/:short_url' => 'urls#short_url_route', :constraints => {:short_url => /(?!.*?login|register|users|admin).*/}
  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'user_sessions#new'
  delete 'logout' => 'user_sessions#destroy'
  get 'register' => 'users#new'
  get 'users' => 'users#index'
  get 'admin' => 'users#admin'

end
