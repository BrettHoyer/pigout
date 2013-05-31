Pigout::Application.routes.draw do
  
  devise_for :users

  root to: 'Yelp#index' 

  match '/index' => 'Yelp#index'
  match '/search' => 'Yelp#search'


 end