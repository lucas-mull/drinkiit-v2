class DropOrdersMealsJoinTable < ActiveRecord::Migration
  def up
    drop_table :orders_meals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
