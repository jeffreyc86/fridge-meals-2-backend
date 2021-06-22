class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :vegetarian, :dish_type, :difficulty, :servings
end
