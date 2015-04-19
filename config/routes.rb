Rails.application.routes.draw do
  #post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  #get 'users/id' => 'users#show'
  root to: 'movies#index'
  get '/movies' => 'movies#index', as: :movies
  post '/movies' => 'movies#create'
  get '/movies/new' => 'movies#new', as: :new
  get '/movies/:id/edit'=> 'movies#edit'
  get '/movies/:id'=> 'movies#show'
  patch '/movies/:id' => 'movies#update'
  put '/movies/:id' => 'movies#update'
  delete '/movies/:id'=> 'movies#destroy'
  #get 'sub_/genres' => 'movies#index'

  resources :ratings, only: :update

  get '/trailers' => 'trailers#index', as: :trailers

  namespace :api do
    namespace :v1 do
      get '/ratings/:movie_id' => 'ratings#show'
      post '/ratings' => 'ratings#create'
    end
  end

  namespace :api do
    namespace :v1 do
      get '/comments/:movie_id' => 'comments#show'
      post '/comments' => 'comments#create'
    end
  end
end