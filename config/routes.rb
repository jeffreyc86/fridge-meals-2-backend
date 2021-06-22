Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :user_ingredients
  resources :recipes
  resources :favorites
  resources :ingredients
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
