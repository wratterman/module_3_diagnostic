Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :welcome, only: [:index]
  get '/search', to: "search#index"
end
