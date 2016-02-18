Rails.application.routes.draw do
  devise_for :clients, :path_names => {:sign_up => "register"}, controllers: { registrations: "registrations"}
  devise_for :users

  root to: 'landing_pages#index'


  get '/users' =>'users#index'
  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/clients' =>'clients#index', as: :clients
  get '/clients/new' => 'clients#new'
  post '/clients/create' => 'clients#create'
  get '/clients/:id' => 'clients#show'
  get '/clients/:id/edit' => 'clients#edit', as: :client_edit
  patch '/clients/:id' => 'clients#update'
  delete '/clients/:id' => 'clients#destroy'


  get '/foreclosures' =>'foreclosures#index', as: :foreclosures
  get '/foreclosures/new' => 'foreclosures#new', as: :foreclosure_intake
  post '/foreclosures/create' => 'foreclosures#create'
  get '/foreclosures/:id' => 'foreclosures#show'
  get '/foreclosures/:id/edit' => 'foreclosures#edit'
  patch '/foreclosures/:id' => 'foreclosures#update'
  delete '/foreclosures/:id' => 'foreclosures#destroy'


  get '/homebuyings' =>'homebuyings#index', as: :homebuyings
  get '/homebuyings/new' => 'homebuyings#new', as: :homebuying_intake
  post '/homebuyings/create' => 'homebuyings#create'
  get '/homebuyings/:id' => 'homebuyings#show'
  get '/homebuyings/:id/edit' => 'homebuyings#edit'
  patch '/homebuyings/:id' => 'homebuyings#update'
  delete '/homebuyings/:id' => 'homebuyings#destroy'


  get '/law_projects' =>'law_projects#index', as: :law_projects
  get '/law_projects/new' => 'law_projects#new', as: :law_project_intake
  post '/law_projects/create' => 'law_projects#create'
  get '/law_projects/:id' => 'law_projects#show'
  get '/law_projects/:id/edit' => 'law_projects#edit'
  patch '/law_projects/:id' => 'law_projects#update'
  delete '/law_projects/:id' => 'law_projects#destroy'


  get '/rentals' =>'rentals#index', as: :rentals
  get '/rentals/new' => 'rentals#new', as: :rental_intake
  post '/rentals/create' => 'rentals#create'
  get '/rentals/:id' => 'rentals#show'
  get '/rentals/:id/edit' => 'rentals#edit'
  patch '/rentals/:id' => 'rentals#update'
  delete '/rentals/:id' => 'rentals#destroy'

  get '/senior_repairs' =>'senior_repairs#index', as: :senior_repairs
  get '/senior_repairs/new' => 'senior_repairs#new', as: :senior_repair_intake
  post '/senior_repairs/create' => 'senior_repairs#create'
  get '/senior_repairs/:id' => 'senior_repairs#show'
  get '/senior_repairs/:id/edit' => 'senior_repairs#edit'
  patch '/senior_repairs/:id' => 'senior_repairs#update'
  delete '/senior_repairs/:id' => 'senior_repairs#destroy'

end

