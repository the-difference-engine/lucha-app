Rails.application.routes.draw do
  devise_for :clients, :path_names => {:sign_up => "register"}
  devise_for :users



  get '/users' =>'users#index'
  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/clients' =>'clients#index'
  get '/clients/new' => 'clients#new'
  post '/clients/create' => 'clients#create'
  get '/clients/:id' => 'clients#show'
  get '/clients/:id/edit' => 'clients#edit'
  patch '/clients/:id' => 'clients#update'
  delete '/clients/:id' => 'clients#destroy'

end

