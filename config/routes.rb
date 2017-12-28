Rails.application.routes.draw do
  get 'auth/starladder/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: %i[new create destroy]
  resource :home, only: :index

  resources :teams
  resources :tourneys, only: :index
  resources :participants, only: :show

  post 'tourneys/:id/join', to: 'tourneys#join_tourney', as: :join_tourney
  delete 'tourneys/:id/leave', to: 'tourneys#leave_tourney', as: :leave_tourney

  root to: 'home#index'
end
