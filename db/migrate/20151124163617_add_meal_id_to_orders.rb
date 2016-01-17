class AddMealIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :meal_id, :integer
  end
end
