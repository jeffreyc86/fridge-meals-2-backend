class User < ApplicationRecord

  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_many :favorites
  has_many :favorite_recipes, through: :favorites, source: :recipe

  has_secure_password

  validates :first_name, :username, :password, presence: true
  validates :first_name, format: { with: /\A([a-zA-Z]|-){2,30}\Z/, message: "only allows letters or hyphens."}
  validates :username, uniqueness: true
  validates :username, format: { with: /\A\w{6,30}\Z/, message: "allows 6-30 characters - using only letters, numbers, and underscores(_)."}
  validates :password, format: { with: /\A\S{5,15}\Z/, message: "allows 5-15 characters."}
  
  def rec_m_ing
    # create an array ingredient id's based on user's ingredients
    ui_arr = user_ingredients.map { |ui| ui.ingredient_id }

    Recipe.all.map do |recipe|
      # create an array of ingredient id's based on the recipe's ingredients
      ri_arr = recipe.recipe_ingredients.map { |ri| ri.ingredient_id }
      {recipe.id => (ri_arr - ui_arr).count}
    end.inject(:merge)
  end

  def missing_ing(recipe_id)
    recipe = Recipe.find(recipe_id)
    ui_arr = self.user_ingredients.map { |ui| ui.ingredient_id }
    ri_arr = recipe.recipe_ingredients.map { |ri| ri.ingredient_id }
    (ri_arr - ui_arr).count
  end

end
