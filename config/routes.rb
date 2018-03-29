Rails.application.routes.draw do

  root to: 'urls#index'
  resources :urls
  get '/:short_url' => 'urls#short_url_route', :constraints => {:short_url => /(?!.*?login).*/}
  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'user_sessions#new'
  delete 'logout' => 'user_sessions#destroy'
  get 'register' => 'users_controller#new'

end
