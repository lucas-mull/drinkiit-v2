class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.float :price, :null => false
      t.boolean :standalone, :null => false
      t.string :description
      t.integer :category_id, :null => false

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :meals
  end
end
