Rails.application.routes.draw do

  root to: 'urls#index'
  resources :urls
  get '/:short_url' => 'urls#short_url_route'

end
