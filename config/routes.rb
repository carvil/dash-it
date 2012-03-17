DashIt::Application.routes.draw do

  root :to => redirect('/projects')
  resources :projects do
    resources :todos
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
