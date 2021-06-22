# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RecipeIngredient.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
User.destroy_all
Favorite.destroy_all

puts "Creating recipes 🍝"

res = RestClient.get("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=100", headers={
    "x-rapidapi-host" => "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
    "x-rapidapi-key" => ENV['API']
})

json = res.body

recipe_hash = JSON.parse(json)

level = ["Easy", "Medium", "Hard"]

recipe_hash["recipes"].each do |recipe|

    new_recipe = Recipe.create(
        name: recipe["title"],
        image: recipe["image"],
        vegetarian: recipe["vegetarian"],
        dish_type: recipe["dishTypes"][0],
        difficulty: level.sample,
        servings: recipe["servings"],
        summary: recipe["summary"],
        instructions: recipe["instructions"],
        time: recipe["readyInMinutes"]
    )

        recipe["extendedIngredients"].each do |ingredient|
            if Ingredient.find_by(image: "https://spoonacular.com/cdn/ingredients_100x100/#{ingredient["image"]}")
                ing = Ingredient.find_by(image: "https://spoonacular.com/cdn/ingredients_100x100/#{ingredient["image"]}")
            else
                ing = Ingredient.create(
                name: ingredient["name"],
                category: ingredient["aisle"],
                image: "https://spoonacular.com/cdn/ingredients_100x100/#{ingredient["image"]}"
            )
            end

                RecipeIngredient.create(
                    recipe_id: new_recipe.id,
                    ingredient_id: ing.id,
                    amount: ingredient["amount"],
                    unit: ingredient["unit"]
                )
        end
end

puts "Creating Humans 👨‍👨‍👧‍👦"
10.times do 
  User.create(first_name: Faker::Name.first_name, username: Faker::Games::Pokemon.name, password: "test1234")
end 


puts "Creating Favorites"
25.times do
  Favorite.create(user: User.all.sample, recipe: Recipe.all.sample)
end