Rails.application.routes.draw do
  root "books#index"

  resources :books do
    member do
      post "borrow"
      post "return"
    end
  end

  get "borrowers/:name", to: "borrowers#history", as: "borrower_history"
end
