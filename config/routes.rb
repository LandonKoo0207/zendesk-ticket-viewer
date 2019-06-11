Rails.application.routes.draw do
  resources :tickets do
    resources :page
  end

  get '/errors', to: 'errors#errors', as: 'errors'

  root "tickets#index"

  match '*unmatched', to: 'application#route_not_found', via: :all
end
