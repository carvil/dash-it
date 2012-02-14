DashIt::Application.routes.draw do

  DashIt::Application.routes.draw do
    root :to => 'projects#index'
    resources :projects
  end
end
