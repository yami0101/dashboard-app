Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboards#index'
  patch '/dashboards/udpate-postitions', to: 'dashboards#update_positions', as: :update_dashboard_positions
  resources :dashboards
end
