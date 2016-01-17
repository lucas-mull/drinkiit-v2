class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :ingredient_type_id, :null => false

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :ingredients
  end
end
