class CreateOrdersMealsJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :orders_meals, :id => false do |t|
  		t.integer :order_id
  		t.integer :meal_id
  	end

  	add_index :orders_meals, [:order_id, :meal_id]
  end
  
  def self.down
    drop_table :orders_meals
  end
end
