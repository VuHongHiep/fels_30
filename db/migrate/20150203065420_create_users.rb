class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :avatar
      t.boolean :admin
      t.integer :words

      t.timestamps
    end
  end
end
