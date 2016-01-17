class CreateIngredientsOrdersJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :ingredients_orders, :id => false do |t|
  		t.integer :ingredient_id
  		t.integer :order_id
  	end

  	add_index :ingredients_orders, [:ingredient_id, :order_id]
  end
  
  def self.down
    drop_table :ingredients_orders
  end
end
