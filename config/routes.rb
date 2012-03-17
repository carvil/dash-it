DashIt::Application.routes.draw do
  devise_for :users

  root :to => redirect('/projects')
  resources :projects do
    resources :todos
  end
end
