Rails.application.routes.draw do
  resources :tickets do
    resources :page
  end

  root "tickets#index"
end
