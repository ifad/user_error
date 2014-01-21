Dummy::Application.routes.draw do
  resources :tests

  root 'tests#index'
end
