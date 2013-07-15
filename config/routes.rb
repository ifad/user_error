Rails.application.routes.draw do
  resources :exceptions, only: :show
end
