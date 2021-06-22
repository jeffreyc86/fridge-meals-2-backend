class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image
      t.boolean :vegetarian
      t.string :dish_type
      t.string :difficulty
      t.integer :servings
      t.text :summary
      t.text :instructions
      t.integer :time

      t.timestamps
    end
  end
end
