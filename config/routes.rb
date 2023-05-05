Rails.application.routes.draw do
    resources :urls, only: [:new, :create]
    get "/:shortened", to: "urls#show"
  end
  