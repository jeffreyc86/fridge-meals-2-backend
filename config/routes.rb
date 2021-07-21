Rails.application.routes.draw do
  
  get "/show", to: "users#show"
  post "/login", to: "users#login"


  resources :recipe_ingredients
  resources :user_ingredients
  resources :recipes
  resources :favorites
  resources :ingredients
  resources :users


end
