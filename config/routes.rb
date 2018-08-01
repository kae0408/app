Rails.application.routes.draw do
  get 'users/index'

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  
  
  get "users/index" => "users#index"
  
  
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  post "posts/create" => "posts#create"

  get '/' => "home#top"
  
  get 'about' => "home#about"
end
