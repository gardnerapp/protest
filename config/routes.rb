Rails.application.routes.draw do
  resources :rebel, only: %i[index create]
  get '/take_action', to: 'rebel#new'
  root 'index#home'
  get '/facts', to: 'index#biology'
  get '/facts/2', to: 'index#more_facts'
  get '/facts/3', to: 'index#even_more_facts'
  get '/facts/4', to: 'index#roast'
  get '/facts/5', to: 'index#jobs'
  get 'freedom', to: 'index#rights'
  get '/about', to: 'index#about'
  get 'error', to: 'index#error'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
