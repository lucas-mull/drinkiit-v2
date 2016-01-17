class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, null: false, unique: true
      t.string :lastname
      t.string :name
      t.float :solde

      t.timestamps null: false
    end
  end
end
