class RenameColumnType < ActiveRecord::Migration
  def self.up
    rename_column :ingredient_types, :type, :name
  end

  def self.down
  end
end
