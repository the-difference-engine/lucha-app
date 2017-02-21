Rails.application.routes.draw do

  devise_for :controllers
  # devise_for :clients, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout'}, controllers: { registrations: "clients/registrations"}, :except => [:new_client_session, :client_session]
  devise_for :clients, controllers: { registrations: "client/registrations"}, :except => [:new_client_session, :client_session]
  devise_scope :client do
    get 'register', to: 'client/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  devise_for :users, controllers: { registrations: "users"}
      devise_scope :user do
      get 'register', to: 'users/registrations#new'
      get 'login', to: 'users/sessions#new'
      delete 'logout', to: 'users/sessions#destroy'

  end

  authenticated :user do
    root to: 'users#show', as: 'authenticated_user_root'
  end
  authenticated :client do
    root to: 'clients#show', as: 'authenticated_client_root'
  end

  root to: 'landing_pages#index'

  namespace :api do
    get '/budgets/:id' => 'budgets#show'
  end

  get '/users' =>'users#index', as: :employee_index
  post '/search' => 'users#search'
  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
  get '/users/:id' => 'users#show', as: :user
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'



  get '/clients(.:format)' =>'clients#index', as: :clients
  get '/clients/:id' => 'clients#show', as: :client
  post '/clients/:id' => 'clients#note_create'
  get 'clients/:id/download' => 'clients#download'
  get '/clients/:id/edit' => 'clients#edit', as: :client_edit
  patch '/clients/:id' => 'clients#update', as: :client_update
  get '/clients/:id/status' => 'clients#status', as: :client_status
  delete '/clients/:id' => 'clients#destroy', as: :client_delete
  patch '/clients/:id/assign' => 'clients#assign', as: :client_assign
  patch '/clients/:id/unassign' => 'clients#unassign', as: :client_unassign

  get '/notes/:id/edit' => 'notes#edit', as: :notes_edit
  patch '/notes/:id' => 'notes#update', as: :note_update

  get '/budgets' => 'budgets#index'
  get '/budgets/new' => 'budgets#new', as: :new_budget
  post '/budgets/create' => 'budgets#create', as: :budget_create
  get '/budgets/:id' => 'budgets#show', as: :budget
  get '/budgets/:id/edit' => 'budgets#edit', as: :edit_budget
  patch '/budgets/:id'=> 'budgets#update', as: :update_budget
  delete '/budgets/:id' => 'budgets#destroy', as: :budget_delete

  get '/foreclosures' =>'foreclosures#index', as: :foreclosures
  get '/foreclosures/new' => 'foreclosures#new', as: :foreclosure_intake
  post '/foreclosures/create' => 'foreclosures#create', as: :foreclosure_create
  get '/foreclosures/:id' => 'foreclosures#show', as: :foreclosure
  get '/foreclosures/:id/edit' => 'foreclosures#edit', as: :foreclosure_edit
  patch '/foreclosures/:id' => 'foreclosures#update', as: :foreclosure_update
  delete '/foreclosures/:id' => 'foreclosures#destroy', as: :foreclosure_delete


  get '/homebuyings' =>'homebuyings#index', as: :homebuyings
  get '/homebuyings/new' => 'homebuyings#new', as: :homebuying_intake
  post '/homebuyings/create' => 'homebuyings#create', as: :homebuying_create
  get '/homebuyings/:id' => 'homebuyings#show', as: :homebuying
  get '/homebuyings/:id/edit' => 'homebuyings#edit', as: :homebuying_edit
  patch '/homebuyings/:id' => 'homebuyings#update', as: :homebuying_update
  delete '/homebuyings/:id' => 'homebuyings#destroy', as: :homebuying_delete


  # get '/law_projects' =>'law_projects#index', as: :law_projects
  # get '/law_projects/new' => 'law_projects#new', as: :law_project_intake
  # post '/law_projects/create' => 'law_projects#create', as: :law_project_create
  # get '/law_projects/:id' => 'law_projects#show', as: :law_project_case
  # get '/law_projects/:id/edit' => 'law_projects#edit', as: :law_project_edit
  # put '/law_projects/:id' => 'law_projects#update', as: :law_project_update
  # delete '/law_projects/:id' => 'law_projects#destroy', as: :law_project_delete


  get '/rentals/index' => 'rentals#index', as: :rentals
  get '/rentals/new' => 'rentals#new', as: :rental_intake
  post '/rentals/create' => 'rentals#create', as: :rental_create
  get '/rentals/:id' => 'rentals#show', as: :rental
  get '/rentals/:id/edit' => 'rentals#edit', as: :rental_edit
  patch '/rentals/:id' => 'rentals#update', as: :rental_update
  delete '/rentals/:id' => 'rentals#destroy', as: :rental_delete

  # get '/senior_repairs' =>'senior_repairs#index', as: :senior_repairs
  # get '/senior_repairs/new' => 'senior_repairs#new', as: :senior_repair_intake
  # post '/senior_repairs/create' => 'senior_repairs#create', as: :senior_repair_create
  # get '/senior_repairs/:id' => 'senior_repairs#show', as: :senior_repair_show
  # get '/senior_repairs/:id/edit' => 'senior_repairs#edit', as: :senior_repair_edit
  # put '/senior_repairs/:id' => 'senior_repairs#update', as: :senior_repair_update
  # delete '/senior_repairs/:id' => 'senior_repairs#destroy', as: :senior_repair_delete


end
