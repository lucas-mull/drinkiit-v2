class CreateIngredientTypes < ActiveRecord::Migration
  def change
    create_table :ingredient_types do |t|
      t.string :type
      t.string :description

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :ingredient_types
  end
end
