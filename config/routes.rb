Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "dashboard#index"

  resources :friends

  get 'change_user', to: 'dashboard#change_user', as: :change_user
end
