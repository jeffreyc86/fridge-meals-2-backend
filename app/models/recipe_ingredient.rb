class RecipeIngredient < ApplicationRecord

  belongs_to :recipe
  belongs_to :ingredient
  
  def amt
      '%.2f' % self.amount
  end
  
end
