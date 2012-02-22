DashIt::Application.routes.draw do
  root :to => redirect('/projects')
  resources :projects
end
