Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :user_ingredients
  resources :recipes
  resources :favorites
  resources :ingredients
  resources :users

  get "/show", to: "users#show"

  
end
