class AddMultipleToIngredientTypes < ActiveRecord::Migration
  def change
    add_column :ingredient_types, :multiple, :boolean
  end
end
