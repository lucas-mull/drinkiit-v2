class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :categories
  end
end
