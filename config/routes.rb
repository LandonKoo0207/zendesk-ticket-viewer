Rails.application.routes.draw do
  resources :tickets do
    resources :page
  end

  get '/errors', to: 'errors#errors', as: 'errors'

  root "tickets#index"
end
