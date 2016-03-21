Rails.application.routes.draw do

  devise_for :clients, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout'}, controllers: { registrations: "registrations"}, :except => [:new_client_session, :client_session]
  devise_for :users

  root to: 'landing_pages#index'

  get '/users' =>'users#index', as: :employee_index
  post '/search' => 'users#search'
  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/case_load' => 'program_employees#index', as: :cases
  post '/case_load' => 'program_employees#create', as: :case_assign

  get '/clients' =>'clients#index', as: :clients
  get '/clients/new' => 'clients#new'
  post '/clients/create' => 'clients#create'
  get '/clients/:id' => 'clients#show', as: :client
  get '/clients/:id/status' => 'clients#status', as: :client_status
  get '/clients/:id/edit' => 'clients#edit', as: :client_edit
  put '/clients/:id' => 'clients#update', as: :client_update
  delete '/clients/:id' => 'clients#destroy', as: :client_delete

  get '/budgets' => 'budgets#index'
  get '/budgets/new' => 'budgets#new', as: :new_budget
  post '/budgets/create' => 'budgets#create', as: :budget_create
  get '/budgets/:id' => 'budgets#show', as: :budget
  get '/budgets/:id/edit' => 'budgets#edit', as: :edit_budget
  put '/budgets/:id' => 'budgets#update', as: :update_budget
  delete '/budgets/:id' => 'budgets#destroy', as: :budget_delete

  get '/foreclosures' =>'foreclosures#index', as: :foreclosures
  get '/foreclosures/new' => 'foreclosures#new', as: :foreclosure_intake
  post '/foreclosures/create' => 'foreclosures#create', as: :foreclosure_create
  get '/foreclosures/:id' => 'foreclosures#show', as: :foreclosure_case
  get '/foreclosures/:id/edit' => 'foreclosures#edit', as: :foreclosure_edit
  put '/foreclosures/:id' => 'foreclosures#update', as: :foreclosure_update
  delete '/foreclosures/:id' => 'foreclosures#destroy', as: :foreclosure_delete


  get '/homebuyings' =>'homebuyings#index', as: :homebuyings
  get '/homebuyings/new' => 'homebuyings#new', as: :homebuying_intake
  post '/homebuyings/create' => 'homebuyings#create', as: :homebuying_create
  get '/homebuyings/:id' => 'homebuyings#show', as: :homebuying_case
  get '/homebuyings/:id/edit' => 'homebuyings#edit', as: :homebuying_edit
  put '/homebuyings/:id' => 'homebuyings#update', as: :homebuying_update
  delete '/homebuyings/:id' => 'homebuyings#destroy', as: :homebuying_delete


  get '/law_projects' =>'law_projects#index', as: :law_projects
  get '/law_projects/new' => 'law_projects#new', as: :law_project_intake
  post '/law_projects/create' => 'law_projects#create', as: :law_project_create
  get '/law_projects/:id' => 'law_projects#show', as: :law_project_case
  get '/law_projects/:id/edit' => 'law_projects#edit', as: :law_project_edit
  put '/law_projects/:id' => 'law_projects#update', as: :law_project_update
  delete '/law_projects/:id' => 'law_projects#destroy', as: :law_project_delete


  get '/rentals' =>'rentals#index', as: :rentals
  get '/rentals/new' => 'rentals#new', as: :rental_intake
  post '/rentals/create' => 'rentals#create', as: :rental_create
  get '/rentals/:id' => 'rentals#show', as: :rental_show
  get '/rentals/:id/edit' => 'rentals#edit', as: :rental_edit
  put '/rentals/:id' => 'rentals#update', as: :rental_update
  delete '/rentals/:id' => 'rentals#destroy', as: :rental_delete

  get '/senior_repairs' =>'senior_repairs#index', as: :senior_repairs
  get '/senior_repairs/new' => 'senior_repairs#new', as: :senior_repair_intake
  post '/senior_repairs/create' => 'senior_repairs#create', as: :senior_repair_create
  get '/senior_repairs/:id' => 'senior_repairs#show', as: :senior_repair_show
  get '/senior_repairs/:id/edit' => 'senior_repairs#edit', as: :senior_repair_edit
  put '/senior_repairs/:id' => 'senior_repairs#update', as: :senior_repair_update
  delete '/senior_repairs/:id' => 'senior_repairs#destroy', as: :senior_repair_delete

end

