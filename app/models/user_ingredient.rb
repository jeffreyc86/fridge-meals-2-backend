class UserIngredient < ApplicationRecord

  belongs_to :user
  belongs_to :ingredient
  
  def amt
      '%.2f' % self.amount
  end

  def ing_name
      ingredient.name
  end
  
end
