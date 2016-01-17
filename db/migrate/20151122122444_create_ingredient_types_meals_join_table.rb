class CreateIngredientTypesMealsJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :ingredient_types_meals, :id => false do |t|
  		t.integer :meal_id
  		t.integer :ingredient_type_id
  	end

  	add_index :ingredient_types_meals, [:meal_id, :ingredient_type_id]
  end
  
  def self.down
    drop_table :ingredient_types_meals
  end
end
