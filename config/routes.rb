Rails.application.routes.draw do
  resources :buses
  resources :bus_events
  resources :bus_stops
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'acces_points#create'
end
