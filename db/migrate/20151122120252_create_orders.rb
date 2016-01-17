class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :ordered_at
      t.boolean :served
      t.float :total
      t.integer :user_id, :null => false

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :orders
  end
end
