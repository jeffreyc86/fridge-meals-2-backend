class UserIngredientSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :ingredient_id, :ing_name, :amount, :unit
end
